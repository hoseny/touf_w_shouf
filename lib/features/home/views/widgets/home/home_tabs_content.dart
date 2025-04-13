import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/features/home/views/manager/home_cubit.dart';
import 'package:touf_w_shouf/features/home/views/widgets/outings/outings_body.dart';

class HomeTabContent extends StatelessWidget {
  const HomeTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<HomeCubit>();
    switch (cubit.state.tabIndex) {
      case 0:
        return const SliverToBoxAdapter(
          child: OutingsBody(),
        );
      case 1:
        return const SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: Text(
              'Hotels Tab Content',
            ),
          ),
        );
      case 2:
        return const SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: Text(
              'Transportation Tab Content',
            ),
          ),
        );
      default:
        return Container();
    }
  }
}
