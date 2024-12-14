import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/extensions.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/core/routing/routes.dart';
import 'package:touf_w_shouf/core/shared/shared_pref.dart';
import 'package:touf_w_shouf/core/shared/shared_pref_keys.dart';
import 'package:touf_w_shouf/core/widgets/app_button.dart';
import 'package:touf_w_shouf/features/program_details/views/manager/program_details_cubit/program_details_cubit.dart';

class ProgramBookButton extends StatelessWidget {
  const ProgramBookButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: AppButton(
          onPressed: () {
            SharedPref.getString(key: SharedPrefKeys.token).isNotEmpty
                ? context.pushNamed(
                    Routes.paymentView,
                    arguments: context.read<ProgramDetailsCubit>().program,
                  )
                : context.pushNamed(
                    Routes.loginView,
                  );
          },
          text: 'Book Now',
          style: TextStyles.font18WhiteMedium,
          backgroundColor: AppColors.orange,
        ),
      ),
    );
  }
}
