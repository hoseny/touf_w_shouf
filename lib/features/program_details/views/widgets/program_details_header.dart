import 'package:flutter/material.dart';
import 'package:touf_w_shouf/core/resources/assets.dart';
import 'package:touf_w_shouf/core/widgets/app_program_header.dart';

class ProgramDetailsHeader extends StatelessWidget {
  const ProgramDetailsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppProgramHeader(
      imageUrl: Assets.listExample,
      title: 'The Egyptian Gulf (Hospice of he Sultan)',
      rating: '4.5',
    );
  }
}
