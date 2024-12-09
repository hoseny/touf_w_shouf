import 'package:flutter/material.dart';
import 'package:touf_w_shouf/features/home/data/models/program_model.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/program_details_body.dart';

class ProgramDetailsView extends StatelessWidget {
  const ProgramDetailsView({super.key, required this.program});

  final ProgramModel program;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProgramDetailsBody(),
    );
  }
}
