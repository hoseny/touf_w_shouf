import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/expandable_container.dart';

class TourTermsAndPolicies extends StatelessWidget {
  const TourTermsAndPolicies({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          ExpandableContainer(title: 'Tour Including', description: 'You can cancel up to 24 hours in advance of the experience for a full refund. For a full refund, you must cancel at least 24 hours before the experience’s start time.If you cancel less than 24 hours before the experience’s start time, the amount you paid will not be refunded. Any changes made less than 24 hours before the experience’s start time will not be accepted. Cut-off times are based on theexperience’s local time.'),
          16.verticalSpace,
          ExpandableContainer(title: 'Tour Excluding', description: 'You can cancel up to 24 hours in advance of the experience for a full refund. For a full refund, you must cancel at least 24 hours before the experience’s start time.If you cancel less than 24 hours before the experience’s start time, the amount you paid will not be refunded. Any changes made less than 24 hours before the experience’s start time will not be accepted. Cut-off times are based on theexperience’s local time.'),
          16.verticalSpace,
          ExpandableContainer(title: 'Cancellation policy', description: 'You can cancel up to 24 hours in advance of the experience for a full refund. For a full refund, you must cancel at least 24 hours before the experience’s start time.If you cancel less than 24 hours before the experience’s start time, the amount you paid will not be refunded. Any changes made less than 24 hours before the experience’s start time will not be accepted. Cut-off times are based on theexperience’s local time.'),
        ],
      ),
    );
  }
}
