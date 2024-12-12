import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:touf_w_shouf/features/onboarding/presentation/manager/onboarding_cubit.dart';
import 'package:touf_w_shouf/features/onboarding/presentation/views/widgets/onboarding_button_row.dart';
import 'package:touf_w_shouf/features/onboarding/presentation/views/widgets/onboarding_dots_indicator.dart';
import 'package:touf_w_shouf/features/onboarding/presentation/views/widgets/onboarding_page_view.dart';
import 'package:touf_w_shouf/features/onboarding/presentation/views/widgets/onboarding_text.dart';

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnboardingCubit>();
    return BlocBuilder<OnboardingCubit, int>(
      builder: (context, currentPage) {
        return Stack(
          alignment: Alignment.center,
          children: [
            OnboardingPageView(
              pageController: cubit.pageController,
              onPageChanged: (index) {
                context.read<OnboardingCubit>().setCurrentPage(index);
              },
            ),
            const OnboardingText(),
            OnboardingDotsIndicator(currentPage: currentPage),
            OnboardingButtonRow(
              pageController: cubit.pageController,
            ),
          ],
        );
      },
    );
  }
}
