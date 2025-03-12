import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/helpers_methods.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/features/payment/presentation/manager/program_group/program_group_cubit.dart';

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
                value: cubit.isTermsAccepted,
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
                    recognizer: TapGestureRecognizer()..onTap = () {},
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
