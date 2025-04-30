import 'package:touf_w_shouf/features/home/data/models/program_model.dart';
import 'package:touf_w_shouf/features/home/data/models/reservation_model.dart';
import 'package:touf_w_shouf/features/home/data/models/voucher_model.dart';

enum ProgramsStatus { initial, loading, success, failure }

enum DayUseProgramStatus { initial, loading, success, failure }

enum PaidReservationStatus { initial, loading, success, failure }

enum UnPaidReservationStatus { initial, loading, success, failure }

enum VoucherStatus { initial, loading, success, failure }

enum WishListStatus { initial, loading, success, failure }

class HomeState {
  final int tabIndex;
  final int reservationTabIndex;
  final String errorMessage;

  // Active programs States
  final ProgramsStatus programsStatus;
  final List<ProgramModel>? programs;

  // Day use programs States
  final DayUseProgramStatus dayUseProgramStatus;
  final List<ProgramModel>? dayUsePrograms;

  // Paid Reservations States
  final PaidReservationStatus paidReservationStatus;
  final List<ReservationModel>? paidReservations;

  // UnPaid Reservations States
  final UnPaidReservationStatus unPaidReservationStatus;
  final List<ReservationModel>? unPaidReservations;

  // Voucher States
  final VoucherStatus voucherStatus;
  final Voucher? voucher;

  // WishList States
  final WishListStatus wishListStatus;
  final List<ProgramModel>? wishList;

  const HomeState({
    this.tabIndex = 0,
    this.reservationTabIndex = 0,
    this.errorMessage = '',
    // Active programs States
    this.programsStatus = ProgramsStatus.initial,
    this.programs,
    // Day use programs States
    this.dayUseProgramStatus = DayUseProgramStatus.initial,
    this.dayUsePrograms,
    // Paid Reservations States
    this.paidReservationStatus = PaidReservationStatus.initial,
    this.paidReservations,
    // UnPaid Reservations States
    this.unPaidReservationStatus = UnPaidReservationStatus.initial,
    this.unPaidReservations,
    // Voucher States
    this.voucherStatus = VoucherStatus.initial,
    this.voucher,
    // WishList States
    this.wishListStatus = WishListStatus.initial,
    this.wishList,
  });

  HomeState copyWith({
    int? tabIndex,
    int? reservationTabIndex,
    String? errorMessage,
    // Active programs States
    ProgramsStatus? programsStatus,
    List<ProgramModel>? programs,
    // Day use programs States
    DayUseProgramStatus? dayUseProgramStatus,
    List<ProgramModel>? dayUsePrograms,
    // Paid Reservations States
    PaidReservationStatus? paidReservationStatus,
    List<ReservationModel>? paidReservations,
    // UnPaid Reservations States
    UnPaidReservationStatus? unPaidReservationStatus,
    List<ReservationModel>? unPaidReservations,
    // Voucher States
    VoucherStatus? voucherStatus,
    Voucher? voucher,
    // WishList States
    WishListStatus? wishListStatus,
    List<ProgramModel>? wishList,
  }) {
    return HomeState(
      tabIndex: tabIndex ?? this.tabIndex,
      reservationTabIndex: reservationTabIndex ?? this.reservationTabIndex,
      errorMessage: errorMessage ?? this.errorMessage,
      // Active programs States
      programsStatus: programsStatus ?? this.programsStatus,
      programs: programs ?? this.programs,
      // Day use programs States
      dayUseProgramStatus: dayUseProgramStatus ?? this.dayUseProgramStatus,
      dayUsePrograms: dayUsePrograms ?? this.dayUsePrograms,
      // Paid Reservations States
      paidReservationStatus:
          paidReservationStatus ?? this.paidReservationStatus,
      paidReservations: paidReservations ?? this.paidReservations,
      // UnPaid Reservations States
      unPaidReservationStatus:
          unPaidReservationStatus ?? this.unPaidReservationStatus,
      unPaidReservations: unPaidReservations ?? this.unPaidReservations,
      // Voucher States
      voucherStatus: voucherStatus ?? this.voucherStatus,
      voucher: voucher ?? this.voucher,
      // WishList States
      wishListStatus: wishListStatus ?? this.wishListStatus,
      wishList: wishList ?? this.wishList,
    );
  }
}
