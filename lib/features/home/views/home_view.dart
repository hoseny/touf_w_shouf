import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/core/di/service_locator.dart';
import 'package:touf_w_shouf/features/home/data/repos/home_repo.dart';
import 'package:touf_w_shouf/features/home/views/manager/home_cubit.dart';
import 'package:touf_w_shouf/features/home/views/widgets/home/home_app_bar.dart';
import 'package:touf_w_shouf/features/home/views/widgets/home/home_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        return HomeCubit(
          getIt.get<HomeRepo>(),
        )
          ..getActivePrograms()
          ..getDayUsePrograms();
      },
      child: const Scaffold(
        appBar: HomeAppBar(),
        body: HomeBody(),
      ),
    );
  }
}
