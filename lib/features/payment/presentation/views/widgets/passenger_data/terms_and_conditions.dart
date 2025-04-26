import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/helpers_methods.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/features/payment/presentation/manager/program_group/program_group_cubit.dart';
import 'package:touf_w_shouf/features/payment/presentation/manager/program_group/program_group_state.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        children: [
          BlocBuilder<ProgramGroupCubit, ProgramGroupState>(
            builder: (context, state) {
              final cubit = context.read<ProgramGroupCubit>();
              return Checkbox(
                value: cubit.state.isTermsAccepted,
                onChanged: (bool? isChecked) {
                  cubit.toggleTerms();
                },
                activeColor: AppColors.orange,
                side: const BorderSide(
                  color: AppColors.fadedGrey,
                ),
              );
            },
          ),
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: isEnglish(context)
                        ? 'I Accept Terms And Conditions and Cancellation policy '
                        : 'أقبل الشروط والأحكام وسياسة الإلغاء',
                    style: TextStyles.font18BlackRegular,
                  ),
                  TextSpan(
                    text: isEnglish(context)
                        ? 'Read Terms and conditions'
                        : 'قراءة الشروط والأحكام',
                    style: TextStyles.font18DeepTealRegular,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return Dialog(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 12.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.r),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  spacing: 6.h,
                                  children: [
                                    Text(
                                      'Terms & Conditions',
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                    Text(
                                      'By using our hotel booking services, you agree to provide accurate information, adhere to the hotel’s booking and cancellation policies, take full responsibility for any additional fees or damages, and acknowledge that the site is not liable for any losses or changes due to unforeseen circumstances',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
