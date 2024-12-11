import 'package:flutter/material.dart';
import 'package:touf_w_shouf/features/home/views/widgets/home/home_header.dart';
import 'package:touf_w_shouf/features/home/views/widgets/home/home_tab_content_section.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        HomeHeader(),
        HomeTabContentSection(),
      ],
    );
  }
}


