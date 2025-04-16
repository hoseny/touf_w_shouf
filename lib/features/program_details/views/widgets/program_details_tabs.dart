import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/helpers_methods.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/program_details_tabs_content.dart';

class ProgramDetailsTabs extends StatefulWidget {
  const ProgramDetailsTabs({super.key});

  @override
  State<ProgramDetailsTabs> createState() => _ProgramDetailsTabsState();
}

class _ProgramDetailsTabsState extends State<ProgramDetailsTabs> {
  int selectedIndex = 0;

  double calculateTextWidth(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();
    return textPainter.size.width;
  }

  @override
  Widget build(BuildContext context) {
    final List<String> tabNames = isEnglish(context)
        ? ['Overview', 'Supplement', 'Photo Gallery', 'Reviews']
        : ['نظرة عامة', 'الاضافات', 'معرض الصور', 'التعليقات'];

    final List<double> textWidths = List.generate(
      tabNames.length,
      (index) => calculateTextWidth(
        tabNames[index],
        selectedIndex == index
            ? TextStyles.font18OrangeMedium
            : TextStyles.font18MutedGreyMedium,
      ),
    );

    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: tabNames.length,
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              separatorBuilder: (context, index) => 16.horizontalSpace,
              itemBuilder: (context, index) {
                return InkWell(
                  borderRadius: BorderRadius.circular(8.r),
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        tabNames[index],
                        style: selectedIndex == index
                            ? TextStyles.font18OrangeMedium
                            : TextStyles.font18MutedGreyMedium,
                      ),
                      4.verticalSpace,
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: 2.h,
                        width: selectedIndex == index ? textWidths[index] : 0,
                        color: Colors.orange,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: ProgramDetailsTabsContent(index: selectedIndex),
          ),
        ],
      ),
    );
  }
}
