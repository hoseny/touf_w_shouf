import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/features/home/data/models/program_model.dart';
import 'package:touf_w_shouf/features/payment/data/models/group_price.dart';
import 'package:touf_w_shouf/features/payment/data/models/program_group.dart';
import 'package:touf_w_shouf/features/payment/data/repo/payment_repo_impl.dart';
import 'package:touf_w_shouf/features/payment/presentation/manager/program_group/program_group_state.dart';

class ProgramGroupCubit extends Cubit<ProgramGroupState> {
  ProgramGroupCubit(this.paymentRepoImpl, this.program) : super(const ProgramGroupState());

  final PaymentRepoImpl paymentRepoImpl;
  final ProgramModel program;
  late ProgramGroup programGroup;
  /// Fetch the program group
  Future<void> getProgramGroup({
    required String programCode,
    required String programYear,
  }) async {
    // Set programGroup loading state
    emit(state.copyWith(
      programGroupStatus: ProgramGroupStatus.loading,
      errorMessage: '',
    ));

    // Fetch program group
    final programGroupResult = await paymentRepoImpl.getProgramGroup(
      programCode: programCode,
      programYear: programYear,
    );

    // Handle result
    programGroupResult.fold(
      (failure) {
        emit(state.copyWith(
          programGroupStatus: ProgramGroupStatus.failure,
          errorMessage: failure.message,
        ));
      },
      (programGroup) {
        emit(
          state.copyWith(
            programGroupStatus: ProgramGroupStatus.success,
            programGroups: programGroup,
          ),
        );
      },
    );
  }

  /// Fetch the group price based on an already-fetched program group
  Future<void> getGroupPrice({
    required String programCode,
    required String programYear,
    required String groupNumber,
  }) async {
    // Check if programGroup exists first
    if (state.programGroups == null) return;

    // Set groupPrice loading state
    emit(state.copyWith(
      groupPriceStatus: GroupPriceStatus.loading,
      errorMessage: '',
    ));

    // Fetch group prices
    final groupPriceResult = await paymentRepoImpl.getGroupPrice(
      programCode: programCode,
      programYear: programYear,
      groupNumber: groupNumber,
    );

    // Handle result
    groupPriceResult.fold(
      (failure) {
        emit(
          state.copyWith(
            groupPriceStatus: GroupPriceStatus.failure,
            errorMessage: failure.message,
          ),
        );
      },
      (groupPrices) {
        emit(
          state.copyWith(
            groupPriceStatus: GroupPriceStatus.success,
            groupPrice: List.unmodifiable(groupPrices),
          ),
        );
      },
    );
  }

  /// Increase the count for a specific group price item.
  void increaseCount(int index) {
    final currentGroupPrices = state.groupPrice;
    if (currentGroupPrices == null || index >= currentGroupPrices.length) {
      return;
    }
    // Create a mutable copy of the group prices list.
    final updatedPrices = List<GroupPrice>.from(currentGroupPrices);
    if (updatedPrices[index].count < 10) {
      updatedPrices[index] = updatedPrices[index].copyWith(count: updatedPrices[index].count + 1);
      emit(state.copyWith(groupPrice: updatedPrices));
    }
  }

  /// Decrease the count for a specific group price item.
  void decreaseCount(int index) {
    final currentGroupPrices = state.groupPrice;
    if (currentGroupPrices == null || index >= currentGroupPrices.length) {
      return;
    }
    final updatedPrices = List<GroupPrice>.from(currentGroupPrices);
    if (updatedPrices[index].count > 0) {
      updatedPrices[index] = updatedPrices[index].copyWith(count: updatedPrices[index].count - 1);
      emit(state.copyWith(groupPrice: updatedPrices));
    }
  }

  /// Calculate the total price based on the selected counts.
  num calculateTotalPrice() {
    if (state.groupPrice == null) return 0;
    return state.groupPrice!
        .fold(0, (sum, item) => sum + item.pPrice * item.count);
  }

  /// Calculate the total count of all selected groups.
  int calculateTotalCount() {
    if (state.groupPrice == null) return 0;
    return state.groupPrice!.fold(0, (sum, item) => sum + item.count);
  }

  /// Toggle the acceptance of terms.
  void toggleTerms() {
    emit(state.copyWith(isTermsAccepted: !state.isTermsAccepted));
  }
}
