import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/core/di/service_locator.dart';
import 'package:touf_w_shouf/features/home/presentation/manager/home_cubit.dart';
import 'package:touf_w_shouf/features/home/presentation/views/widgets/home/home_app_bar.dart';
import 'package:touf_w_shouf/features/home/presentation/views/widgets/home/home_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final HomeCubit cubit = getIt.get<HomeCubit>();
        cubit.getActivePrograms();
        cubit.getDayUsePrograms();
        return cubit;
      },
      child: const Scaffold(
        appBar: HomeAppBar(),
        body: HomeBody(),
      ),
    );
  }
}
