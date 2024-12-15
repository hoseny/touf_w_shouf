
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
  int totalPrice = 0;
  int totalCount = 0;

  Future<void> getGroup({required String programCode, required String programYear,}) async {
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
    emit(
      ProgramGroupSuccess(
        programGroup: programGroup,
        groupPrice: groupPrices,
      ),
    );
  }

  void increaseCount(int index) {
    if (groupPrices[index].count < 10) {
      groupPrices[index].count++;
      emit(
        ProgramGroupSuccess(
          programGroup: (state as ProgramGroupSuccess).programGroup,
          groupPrice: List.from(groupPrices),
        ),
      );
    }
  }

  void decreaseCount(int index) {
    if (groupPrices[index].count > 0) {
      groupPrices[index].count--;
      emit(
        ProgramGroupSuccess(
          programGroup: (state as ProgramGroupSuccess).programGroup,
          groupPrice: List.from(groupPrices),
        ),
      );
    }
  }

  int calculateTotalPrice() {
    int totalPrice = 0;
    for (var pax in groupPrices) {
      totalPrice += pax.pPrice * pax.count;
    }
    return totalPrice;
  }

  void calculateTotalCount() {
    for (var pax in groupPrices) {
      totalCount += pax.count;
    }
  }
}
