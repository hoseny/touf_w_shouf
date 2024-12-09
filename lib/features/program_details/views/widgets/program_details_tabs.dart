import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/program_details_tabs_content.dart';

class ProgramDetailsTabs extends StatefulWidget {
  const ProgramDetailsTabs({super.key});

  @override
  State<ProgramDetailsTabs> createState() => _ProgramDetailsTabsState();
}

class _ProgramDetailsTabsState extends State<ProgramDetailsTabs> {
  int selectedIndex = 0;

  final List<String> tabNames = [
    'Overview',
    'Supplement',
    'Photo Gallery',
    'Reviews',
  ];
  late List<double> textWidths;

  @override
  void initState() {
    super.initState();
    textWidths = List.generate(
      tabNames.length,
      (index) => calculateTextWidth(
        tabNames[index],
        TextStyles.font18OrangeMedium,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          SizedBox(
            height: 40.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tabNames.length,
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: index != 0 ? 12.w : 0),
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

  double calculateTextWidth(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();
    return textPainter.size.width;
  }
}
