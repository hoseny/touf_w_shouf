import 'package:flutter/material.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/program_book_button.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/program_details_buttons.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/program_details_header.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/program_details_tabs.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/program_information.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/tour_terms_and_policies.dart';

class ProgramDetailsBody extends StatelessWidget {
  const ProgramDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        ProgramDetailsHeader(),
        //ProgramDetailsButtons(),
        ProgramInformation(),
        ProgramDetailsTabs(),
        TourTermsAndPolicies(),
        ProgramBookButton(),
      ],
    );
  }
}


