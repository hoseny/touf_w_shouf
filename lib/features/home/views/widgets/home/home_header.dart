import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/features/home/views/widgets/home/home_carousel.dart';
import 'package:touf_w_shouf/features/home/views/widgets/home/home_tabs.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300.h,
      toolbarHeight: 0,
      pinned: false,
      backgroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            HomeCarousel(),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: const HomeTabs(),
            ),
          ],
        ),
      ),
    );
  }
}