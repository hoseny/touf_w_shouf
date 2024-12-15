import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/features/home/views/manager/home_tab/home_tab_cubit.dart';
import 'package:touf_w_shouf/features/home/views/widgets/outings/outings_body.dart';

class HomeTabContent extends StatelessWidget {
  const HomeTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<HomeTabCubit, int>(
        builder: (context, currentTab) {
          switch (currentTab) {
            case 0:
              return const OutingsBody();
            case 1:
              return const Text('Hotels Tab Content');
            case 2:
              return const Text('Transportation Tab Content');
            default:
              return Container();
          }
        },
      ),
    );
  }
}
