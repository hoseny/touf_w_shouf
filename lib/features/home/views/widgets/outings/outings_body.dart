import 'package:flutter/material.dart';
import 'package:touf_w_shouf/features/home/views/widgets/outings/program_list_header.dart';
import 'package:touf_w_shouf/features/home/views/widgets/outings/program_list_view.dart';

class OutingsBody extends StatelessWidget {
  const OutingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProgramListHeader(),
        ProgramListView(),
      ],
    );
  }
}


