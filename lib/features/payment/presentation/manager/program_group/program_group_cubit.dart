import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/features/home/data/models/program_model.dart';
import 'package:touf_w_shouf/features/payment/data/models/group_price.dart';
import 'package:touf_w_shouf/features/payment/data/models/program_group.dart';
import 'package:touf_w_shouf/features/payment/data/repo/payment_repo_impl.dart';

part 'program_group_state.dart';

class ProgramGroupCubit extends Cubit<ProgramGroupState> {
  ProgramGroupCubit(this.paymentRepoImpl, this.program) : super(ProgramGroupInitial());
  final PaymentRepoImpl paymentRepoImpl;
  final ProgramModel program;
  List<GroupPrice> groupPrices = [];
  bool isTermsAccepted = false;
  late ProgramGroup programGroup;

  // Fetch Program Group and Group Prices
  Future<void> getGroup({
    required String programCode,
    required String programYear,
  }) async {
    emit(ProgramGroupLoading());

    final programGroupResult = await paymentRepoImpl.getProgramGroup(
      programCode: programCode,
      programYear: programYear,
    );

    final programGroup = programGroupResult.fold(
      (failure) {
        emit(ProgramGroupFailure(failure.message));
        return null;
      },
      (group) => group,
    );

    if (programGroup == null) return;
    this.programGroup = programGroup;
    final groupPriceResult = await paymentRepoImpl.getGroupPrice(
      programCode: programCode,
      programYear: programYear,
      groupNumber: programGroup.progGrpNo.toString(),
    );

    final groupPrices = groupPriceResult.fold(
      (failure) {
        emit(ProgramGroupFailure(failure.message));
        return null;
      },
      (price) => price,
    );

    if (groupPrices == null) return;

    this.groupPrices = groupPrices;
    emitProgramGroupSuccess(programGroup, groupPrices);
  }

  // Helper to emit ProgramGroupSuccess
  void emitProgramGroupSuccess(
      ProgramGroup programGroup, List<GroupPrice> groupPrices) {
    emit(
      ProgramGroupSuccess(
        programGroup: programGroup,
        groupPrice: List.unmodifiable(groupPrices), // Prevent external mutation
      ),
    );
  }

  // Increase count for a specific group
  void increaseCount(int index) {
    if (groupPrices[index].count < 10) {
      groupPrices[index].count++;
      emitProgramGroupSuccess(
        (state as ProgramGroupSuccess).programGroup,
        groupPrices,
      );
    }
  }

  // Decrease count for a specific group
  void decreaseCount(int index) {
    if (groupPrices[index].count > 0) {
      groupPrices[index].count--;
      emitProgramGroupSuccess(
        (state as ProgramGroupSuccess).programGroup,
        groupPrices,
      );
    }
  }

  // Calculate the total price for the selected group
  int calculateTotalPrice() {
    int totalPrice = groupPrices.fold(0, (sum, pax) => sum + pax.pPrice * pax.count);
    return totalPrice;
  }

  // Calculate the total count of all groups
  int calculateTotalCount() {
    int totalCount = groupPrices.fold(0, (sum, pax) => sum + pax.count);
    return totalCount;
  }

  // Toggle the acceptance of terms
  void toggleTerms() {
    isTermsAccepted = !isTermsAccepted;
    emitProgramGroupSuccess(
      (state as ProgramGroupSuccess).programGroup,
      groupPrices,
    );
  }
}
