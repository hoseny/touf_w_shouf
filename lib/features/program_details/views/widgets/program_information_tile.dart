import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';

class ProgramInformationTile extends StatelessWidget {
  const ProgramInformationTile(
      {super.key, required this.svg, required this.title, required this.value});

  final String svg;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          SvgPicture.asset(svg),
          10.horizontalSpace,
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: title,
                    style: TextStyles.font16MutedGreyRegular,
                  ),
                  TextSpan(
                    text: value,
                    style: TextStyles.font16BlackRegular,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
