import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/core/di/service_locator.dart';
import 'package:touf_w_shouf/features/home/data/models/program_model.dart';
import 'package:touf_w_shouf/features/program_details/views/manager/program_details_cubit.dart';
import 'package:touf_w_shouf/features/program_details/views/widgets/program_details_bloc_builder.dart';

class ProgramDetailsView extends StatelessWidget {
  const ProgramDetailsView({super.key, required this.program});

  final ProgramModel program;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final ProgramDetailsCubit cubit = getIt.get<ProgramDetailsCubit>(param1: program);
        cubit.getProgramDetails();
        return cubit;
      },
      child: const Scaffold(
        body: ProgramDetailsBodyBlocBuilder(),
      ),
    );
  }
}
