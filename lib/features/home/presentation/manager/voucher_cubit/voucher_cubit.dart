import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/features/home/data/models/voucher_model.dart';
import 'package:touf_w_shouf/features/home/data/repos/home_repo.dart';

part 'voucher_state.dart';

class VoucherCubit extends Cubit<VoucherState> {
  VoucherCubit(this.homeRepo) : super(VoucherInitial());
  final HomeRepo homeRepo;

  Future<void> getVoucher({required String resNo}) async {
    emit(VoucherLoading());
    final response = await homeRepo.getVoucher(resNo: resNo);
    response.fold(
      (failure) => emit(
        VoucherFailure(message: failure.message),
      ),
      (voucher) => emit(
        VoucherSuccess(voucher: voucher),
      ),
    );
  }
}
