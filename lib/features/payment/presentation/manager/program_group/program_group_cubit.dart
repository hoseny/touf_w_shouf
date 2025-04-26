import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/core/helpers/toast_helper.dart';
import 'package:touf_w_shouf/features/home/data/models/program_model.dart';
import 'package:touf_w_shouf/features/payment/data/models/program_group.dart';
import 'package:touf_w_shouf/features/payment/data/models/services_model.dart';
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
          (services) {
        emit(
          state.copyWith(
            groupPriceStatus: GroupPriceStatus.success,
            services: services,
          ),
        );
      },
    );
  }

  /// Increase the count for a specific group price item.
  void increaseGroupPriceCount(int index) {
    final currentGroupPrices = state.services?.groupPrice ?? [];
    if (index >= currentGroupPrices.length) return;

    final currentTotal = calculateTotalCount();
    final updatedPrices = List<GroupPrice>.from(currentGroupPrices);

    if ((currentTotal + 1) <= programGroup.paxAval) {
      updatedPrices[index] = updatedPrices[index].copyWith(count: updatedPrices[index].count + 1);
      emit(state.copyWith(services: state.services?.copyWith(groupPrice: updatedPrices)));
    } else {
      ToastHelper.showErrorToast('Pax limit exceeded');
    }
  }

  /// Decrease the count for a specific group price item.
  void decreaseGroupPriceCount(int index) {
    final currentGroupPrices = state.services?.groupPrice ?? [];
    if (index >= currentGroupPrices.length) return;

    final updatedPrices = List<GroupPrice>.from(currentGroupPrices);

    if (updatedPrices[index].count > 0) {
      updatedPrices[index] = updatedPrices[index].copyWith(count: updatedPrices[index].count - 1);
      emit(state.copyWith(services: state.services?.copyWith(groupPrice: updatedPrices)));
    }
  }

  /// Increase the count for an additional service.
  void increaseAdditionalServiceCount(int index) {
    final currentServices = state.services?.additionalServices ?? [];
    if (index >= currentServices.length) return;

    final currentTotal = calculateTotalCount();
    final updatedServices = List<AdditionalService>.from(currentServices);

    if ((currentTotal + 1) <= programGroup.paxAval) {
      updatedServices[index] = updatedServices[index].copyWith(count: updatedServices[index].count + 1);
      emit(state.copyWith(services: state.services?.copyWith(additionalServices: updatedServices)));
    } else {
      ToastHelper.showErrorToast('Pax limit exceeded');
    }
  }

  /// Decrease the count for an additional service.
  void decreaseAdditionalServiceCount(int index) {
    final currentServices = state.services?.additionalServices ?? [];
    if (index >= currentServices.length) return;

    final updatedServices = List<AdditionalService>.from(currentServices);

    if (updatedServices[index].count > 0) {
      updatedServices[index] = updatedServices[index].copyWith(count: updatedServices[index].count - 1);
      emit(state.copyWith(services: state.services?.copyWith(additionalServices: updatedServices)));
    }
  }

  /// Calculate the total price based on the selected counts from both group prices and additional services.
  double calculateTotalPrice() {
    double total = 0.0;

    if (state.services?.groupPrice != null) {
      total += state.services!.groupPrice.fold<double>(
        0.0,
            (sum, item) => sum + item.pPrice.toDouble() * item.count,
      );
    }

    if (state.services?.additionalServices != null) {
      total += state.services!.additionalServices.fold<double>(
        0.0,
            (sum, item) => sum + item.extPrice.toDouble() * item.count,
      );
    }

    return total;
  }


  /// Calculate the total count of all selected groups and services.
  int calculateTotalCount() {
    int total = 0;

    if (state.services?.groupPrice != null) {
      total += state.services!.groupPrice
          .fold(0, (sum, item) => sum + item.count);
    }

    if (state.services?.additionalServices != null) {
      total += state.services!.additionalServices
          .fold(0, (sum, item) => sum + item.count);
    }

    return total;
  }


  /// Toggle the acceptance of terms.
  void toggleTerms() {
    emit(state.copyWith(isTermsAccepted: !state.isTermsAccepted));
  }
}
