import 'package:flutter/material.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/expandable_container.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/program_details_buttons.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/program_details_header.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/program_information.dart';

class ProgramDetailsBody extends StatelessWidget {
  const ProgramDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        ProgramDetailsHeader(),
        ProgramDetailsButtons(),
        ProgramInformation(),
        ExpandableContainer(title: 'Cancellation policy', description: 'You can cancel up to 24 hours in advance of the experience for a full refund. For a full refund, you must cancel at least 24 hours before the experience’s start time.If you cancel less than 24 hours before the experience’s start time, the amount you paid will not be refunded. Any changes made less than 24 hours before the experience’s start time will not be accepted. Cut-off times are based on theexperience’s local time.')
      ],
    );
  }
}

