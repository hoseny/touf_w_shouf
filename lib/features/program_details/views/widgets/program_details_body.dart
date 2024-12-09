import 'package:flutter/material.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/action_button.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/program_details_header.dart';

class ProgramDetailsBody extends StatelessWidget {
  const ProgramDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        ProgramDetailsHeader(),
        ActionButtons(),
      ],
    );
  }
}

