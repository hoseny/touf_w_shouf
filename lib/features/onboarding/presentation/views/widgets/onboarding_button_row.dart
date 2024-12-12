import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/extensions.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/core/routing/routes.dart';
import 'package:touf_w_shouf/features/onboarding/presentation/manager/onboarding_cubit.dart';
import 'package:touf_w_shouf/features/onboarding/presentation/views/widgets/onboarding_button.dart';

class OnboardingButtonRow extends StatelessWidget {
  const OnboardingButtonRow({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final currentPage = context.watch<OnboardingCubit>().state;

    void handleNext() {
      if (currentPage < 2) {
        pageController.animateToPage(
          currentPage + 1,
          duration: const Duration(milliseconds: 400),
          curve: Curves.decelerate,
        );
      } else {
        context.pushReplacementNamed(Routes.loginView);
      }
    }

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
            onTap: handleNext,
          ),
        ],
      ),
    );
  }
}
