part of 'voucher_cubit.dart';

@immutable
sealed class VoucherState {}

final class VoucherInitial extends VoucherState {}

final class VoucherLoading extends VoucherState {}

final class VoucherSuccess extends VoucherState {
  final Voucher voucher;

  VoucherSuccess({required this.voucher});
}

final class VoucherFailure extends VoucherState {
  final String message;

  VoucherFailure({required this.message});
}
