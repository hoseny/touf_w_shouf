import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/features/home/views/manager/home_tab/home_tab_cubit.dart';
import 'package:touf_w_shouf/features/home/views/widgets/home/home_tabs_content.dart';

class HomeTabContentSection extends StatelessWidget {
  const HomeTabContentSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<HomeTabCubit, HomeTabState>(
        builder: (context, state) {
          if (state is HomeTabIndexUpdated) {
            return HomeTabContent(
              index: state.index,
            );
          }
          return const HomeTabContent(
            index: 0,
          );
        },
      ),
    );
  }
}
