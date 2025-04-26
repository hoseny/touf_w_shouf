import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/core/helpers/extensions.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/routing/routes.dart';
import 'package:touf_w_shouf/features/home/presentation/manager/home_cubit.dart';
import 'package:touf_w_shouf/features/home/presentation/manager/home_state.dart';
import 'package:touf_w_shouf/features/home/presentation/views/widgets/see_all/see_all_list_view.dart';

class SeeAllDayUse extends StatelessWidget {
  const SeeAllDayUse({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        switch (state.dayUseProgramStatus) {
          case DayUseProgramStatus.loading:
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryBlue,
              ),
            );
          case DayUseProgramStatus.success:
            return ListView.builder(
              itemCount: state.dayUsePrograms!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    context.pushNamed(
                      Routes.programDetailsView,
                      arguments: state.dayUsePrograms![index],
                    );
                  },
                  child: SeeAllListViewItem(
                    programModel: state.dayUsePrograms![index],
                  ),
                );
              },
            );
          case DayUseProgramStatus.failure:
            return Center(child: Text(state.errorMessage));
          default:
            return const Center(child: Text('Unhandled State'));
        }
      },
    );
  }
}
