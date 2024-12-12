import 'package:flutter/material.dart';

import 'package:touf_w_shouf/core/widgets/app_program_header.dart';
import 'package:touf_w_shouf/features/home/data/models/program_model.dart';

class PaymentHeader extends StatelessWidget {
  const PaymentHeader({super.key, required this.program});
final ProgramModel program;
  @override
  Widget build(BuildContext context) {
    return  AppProgramHeader(
      imageUrl: program.imgPath,
      title: program.programName,
      rating: program.rateReview,
    );
  }
}
