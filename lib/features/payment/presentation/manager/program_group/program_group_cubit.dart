import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/core/helpers/toast_helper.dart';
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

  Future<void> getProgramGroup({
    required String programCode,
    required String programYear,
  }) async {
    emit(state.copyWith(
      programGroupStatus: ProgramGroupStatus.loading,
      errorMessage: '',
    ));

    final programGroupResult = await paymentRepoImpl.getProgramGroup(
      programCode: programCode,
      programYear: programYear,
    );

    programGroupResult.fold(
      (failure) {
        emit(
          state.copyWith(
            programGroupStatus: ProgramGroupStatus.failure,
            errorMessage: failure.message,
          ),
        );
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

  Future<void> getGroupPrice({
    required String programCode,
    required String programYear,
    required String groupNumber,
  }) async {
    if (state.programGroups == null) return;

    emit(state.copyWith(
      groupPriceStatus: GroupPriceStatus.loading,
      errorMessage: '',
    ));

    final groupPriceResult = await paymentRepoImpl.getGroupPrice(
      programCode: programCode,
      programYear: programYear,
      groupNumber: groupNumber,
    );

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

    // Calculate the current total count across all group price items.
    final currentTotal = calculateTotalCount();

    // Create a mutable copy of the group prices list.
    final updatedPrices = List<GroupPrice>.from(currentGroupPrices);

    // Increase the count only if the new total count won't exceed paxAval.
    if ((currentTotal + 1) <= programGroup.paxAval) {
      updatedPrices[index] =
          updatedPrices[index].copyWith(count: updatedPrices[index].count + 1);
      emit(state.copyWith(groupPrice: updatedPrices));
    } else {
      ToastHelper.showErrorToast('Pax limit exceeded');
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
      updatedPrices[index] =
          updatedPrices[index].copyWith(count: updatedPrices[index].count - 1);
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
