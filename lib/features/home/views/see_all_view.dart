import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/core/di/service_locator.dart';
import 'package:touf_w_shouf/core/routing/args_model/sell_all_model.dart';
import 'package:touf_w_shouf/features/home/views/manager/home_cubit.dart';
import 'package:touf_w_shouf/features/home/views/widgets/see_all/see_all_app_bar.dart';
import 'package:touf_w_shouf/features/home/views/widgets/see_all/see_all_active_programs.dart';
import 'package:touf_w_shouf/features/home/views/widgets/see_all/see_all_day_use.dart';

class SeeAllView extends StatelessWidget {
  const SeeAllView({super.key, required this.seeAllModel});

  final SeeAllModel seeAllModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SeeAllAppBar(title: seeAllModel.title),
      body: BlocProvider(
        create: (context) {
          final HomeCubit cubit = getIt.get<HomeCubit>();

          if (seeAllModel.isDayUsePrograms) {
            cubit.getDayUsePrograms();
          } else {
            cubit.getActivePrograms();
          }

          return cubit;
        },
        child: seeAllModel.isDayUsePrograms
            ? const SeeAllDayUse()
            : const SeeAllActivePrograms(),
      ),
    );
  }
}
