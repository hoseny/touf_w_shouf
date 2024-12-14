import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/extensions.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/core/routing/routes.dart';
import 'package:touf_w_shouf/core/shared/shared_pref.dart';
import 'package:touf_w_shouf/core/shared/shared_pref_keys.dart';
import 'package:touf_w_shouf/features/onboarding/presentation/manager/onboarding_cubit.dart';
import 'package:touf_w_shouf/features/onboarding/presentation/views/widgets/onboarding_button.dart';

class OnboardingButtonRow extends StatefulWidget {
  const OnboardingButtonRow({super.key, required this.pageController});

  final PageController pageController;

  @override
  State<OnboardingButtonRow> createState() => _OnboardingButtonRowState();
}

class _OnboardingButtonRowState extends State<OnboardingButtonRow> {
  Future<void> handleFirstLaunch() async {
    final isFirstLaunch = SharedPref.getBool(key: SharedPrefKeys.isFirstLaunch) ?? true;
    if (isFirstLaunch) {
      await SharedPref.setData(
        key: SharedPrefKeys.isFirstLaunch,
        value: false,
      );
    }
  }

  Future<void> handleNext({required BuildContext context, required int currentPage}) async {
    if (currentPage < 2) {
      widget.pageController.animateToPage(
        currentPage + 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.decelerate,
      );
    } else {
      await handleFirstLaunch();
      if (context.mounted) {
        context.pushReplacementNamed(Routes.homeView);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentPage = context.watch<OnboardingCubit>().state;

    return Positioned(
      bottom: 40.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OnboardingButton(
            color: AppColors.mutedGrey,
            text: 'Skip',
            style: TextStyles.font16WhiteRegular,
            onTap: () {
              context.pushReplacementNamed(Routes.loginView);
            },
          ),
          16.horizontalSpace,
          OnboardingButton(
            color: Colors.white,
            text: currentPage < 2 ? 'Next' : 'Finish',
            onTap: () => handleNext(context: context, currentPage: currentPage),
          ),
        ],
      ),
    );
  }
}
