import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/core/helpers/extensions.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/routing/routes.dart';
import 'package:touf_w_shouf/features/home/views/manager/home_cubit/home_cubit.dart';
import 'package:touf_w_shouf/features/home/views/widgets/see_all/see_all_list_view.dart';

class SeeAllBody extends StatelessWidget {
  const SeeAllBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is ActiveProgramsLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryBlue,
            ),
          );
        } else if (state is ActiveProgramsSuccess) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  context.pushNamed(
                    Routes.programDetailsView,
                    arguments: state.programs[index],
                  );
                },
                child: SeeAllListViewItem(
                  programModel: state.programs[index],
                ),
              );
            },
            itemCount: state.programs.length,
          );
        } else if (state is ActiveProgramsFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return const Center(child: Text('Unhandled State'));
        }
      },
    );
  }
}
