import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/core/di/service_locator.dart';
import 'package:touf_w_shouf/core/helpers/helpers_methods.dart';
import 'package:touf_w_shouf/features/home/data/repos/home_repo_impl.dart';
import 'package:touf_w_shouf/features/home/views/manager/home_cubit/home_cubit.dart';
import 'package:touf_w_shouf/features/home/views/widgets/see_all/see_all_app_bar.dart';
import 'package:touf_w_shouf/features/home/views/widgets/see_all/see_all_body.dart';

class SeeAllView extends StatelessWidget {
  const SeeAllView({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SeeAllAppBar(title: title),
      body: BlocProvider(
        create: (context) => HomeCubit(getIt.get<HomeRepoImpl>())..getActivePrograms(),
        child: const SeeAllBody(),
      ),
    );
  }
}
