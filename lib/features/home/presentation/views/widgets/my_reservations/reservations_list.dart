import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/core/widgets/app_cached_network_image.dart';
import 'package:touf_w_shouf/features/home/data/models/reservation_model.dart';

class ReservationsList extends StatelessWidget {
  const ReservationsList({
    super.key,
    required this.reservations,
  });

  final List<ReservationModel> reservations;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: reservations.length,
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 8.w,
        ),
        separatorBuilder: (_, __) => 12.verticalSpace,
        itemBuilder: (context, index) {
          final reservation = reservations[index];
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 5,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4.h,
              children: [
                AppCachedNetworkImage(
                  imgUrl: reservation.imgPath,
                  height: 200.h,
                  width: double.infinity,
                  borderRadius: 12.r,
                ),
                _textRow(
                  title: 'Customer Name: ',
                  value: reservation.customerName,
                ),
                _textRow(
                  title: 'Program Name: ',
                  value: reservation.programName,
                ),
                _textRow(
                  title: 'Program Year : ',
                  value: reservation.progYear.toString(),
                ),
                _textRow(
                  title: 'Trip Date: ',
                  value: DateFormat('dd/MM/yyyy').format(reservation.dateTrip),
                ),
                _textRow(
                  title: 'Reservation No: ',
                  value: reservation.reservationNo.toString(),
                ),
                _textRow(
                  title: 'Total Price: ',
                  value: '${reservation.totalPayMent.toStringAsFixed(0)} EGP',
                ),
                _textRow(
                  title: 'Status: ',
                  value: reservation.payMentStatus,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _textRow({
    required String title,
    required String value,
  }) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyles.font16OrangeMedium,
          ),
          TextSpan(
            text: value,
            style: TextStyles.font16BlackMedium,
          ),
        ],
      ),
    );
  }
}
