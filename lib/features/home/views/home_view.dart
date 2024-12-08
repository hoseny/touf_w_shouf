import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/core/di/service_locator.dart';
import 'package:touf_w_shouf/features/home/data/repos/home_repo_impl.dart';
import 'package:touf_w_shouf/features/home/views/manager/home_cubit/home_cubit.dart';
import 'package:touf_w_shouf/features/home/views/manager/home_tab/home_tab_cubit.dart';
import 'package:touf_w_shouf/features/home/views/widgets/home/home_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeTabCubit(),
          ),
          BlocProvider(
            create: (context) => HomeCubit(getIt.get<HomeRepoImpl>())..getActivePrograms(),
          ),
        ],
        child: HomeBody(),
      ),
    );
  }
}
