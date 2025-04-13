import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/core/helpers/extensions.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/routing/routes.dart';
import 'package:touf_w_shouf/features/home/views/manager/home_cubit.dart';
import 'package:touf_w_shouf/features/home/views/manager/home_state.dart';
import 'package:touf_w_shouf/features/home/views/widgets/see_all/see_all_list_view.dart';

class SeeAllBody extends StatelessWidget {
  const SeeAllBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        switch (state.programsStatus) {
          case ProgramsStatus.loading:
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryBlue,
              ),
            );
          case ProgramsStatus.success:
            return ListView.builder(
              itemCount: state.programs!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    context.pushNamed(
                      Routes.programDetailsView,
                      arguments: state.programs![index],
                    );
                  },
                  child: SeeAllListViewItem(
                    programModel: state.programs![index],
                  ),
                );
              },
            );
          case ProgramsStatus.failure:
            return Center(child: Text(state.errorMessage));
          default:
            return const Center(child: Text('Unhandled State'));
        }
      },
    );
  }
}
