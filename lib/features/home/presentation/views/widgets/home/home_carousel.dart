import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/assets.dart';

class HomeCarousel extends StatelessWidget {
  const HomeCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 3,
      itemBuilder: (context, index, realIndex) {
        List<String> images = [
          Assets.homeHeader,
          Assets.example1,
          Assets.example2
        ];
        return Stack(
          children: [
            Image.asset(
              images[index],
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
          ],
        );
      },
      options: CarouselOptions(
        viewportFraction: 1,
        height: 300.h,
        enableInfiniteScroll: true,
        autoPlay: false,
        autoPlayInterval: const Duration(seconds: 5),
      ),
    );
  }
}