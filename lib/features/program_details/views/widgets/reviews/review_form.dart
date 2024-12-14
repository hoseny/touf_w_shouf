import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/extensions.dart';
import 'package:touf_w_shouf/core/helpers/font_weight_helper.dart';
import 'package:touf_w_shouf/core/helpers/toast_helper.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';
import 'package:touf_w_shouf/core/routing/routes.dart';
import 'package:touf_w_shouf/core/shared/shared_pref.dart';
import 'package:touf_w_shouf/core/shared/shared_pref_keys.dart';
import 'package:touf_w_shouf/core/widgets/app_button.dart';
import 'package:touf_w_shouf/features/program_details/data/models/insert_review/insert_review_request.dart';
import 'package:touf_w_shouf/features/program_details/views/manager/review_cubit/review_cubit.dart';

class ReviewForm extends StatefulWidget {
  const ReviewForm({super.key});

  @override
  State<ReviewForm> createState() => _ReviewFormState();
}

class _ReviewFormState extends State<ReviewForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late final TextEditingController reviewController;
  AutovalidateMode? autoValidateMode;

  @override
  void initState() {
    reviewController = TextEditingController();
    autoValidateMode = AutovalidateMode.disabled;
    super.initState();
  }

  @override
  void dispose() {
    reviewController.dispose();
    autoValidateMode = AutovalidateMode.disabled;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Form(
            key: formKey,
            autovalidateMode: autoValidateMode,
            child: TextFormField(
              maxLines: 5,
              controller: reviewController,
              cursorColor: AppColors.orange,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xffFAFAFA),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: const BorderSide(color: AppColors.orange),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: const BorderSide(color: AppColors.error),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: const BorderSide(color: AppColors.error),
                ),
                hintText: 'Write your feedback',
                hintStyle: TextStyle(
                  fontSize: 16.sp,
                  color: const Color(0xff747474),
                  fontWeight: FontWeightHelper.regular,
                ),
                errorStyle: TextStyles.error,
                contentPadding: EdgeInsets.all(12.w),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your review';
                }
                return null;
              },
              style: TextStyles.font16BlackRegular,
            ),
          ),
          16.verticalSpace,
          BlocConsumer<ReviewCubit, ReviewState>(
            listener: (context, state) {
              if (state is InsertReviewSuccess) {
                context.read<ReviewCubit>().getReviews();
                ToastHelper.showSuccessToast(state.message);
              } else if (state is InsertReviewFailure) {
                ToastHelper.showErrorToast(state.errorMessage);
              }
            },
            builder: (context, state) {
              return AppButton(
                isLoading: state is InsertReviewLoading,
                onPressed: onPressed,
                text: 'Submit',
                backgroundColor: AppColors.orange,
                borderRadius: 4.r,
                width: 160.w,
              );
            },
          )
        ],
      ),
    );
  }

  onPressed() {
    FocusScope.of(context).unfocus();

    final token = SharedPref.getString(key: SharedPrefKeys.token);
    final userRating = context.read<ReviewCubit>().userRating;

    if (token.isEmpty) {
      context.pushNamed(Routes.loginView);
      return;
    }

    if (userRating == 0) {
      ToastHelper.showErrorToast('Please select a rating');
      return;
    }
    final isFormValid = formKey.currentState?.validate() ?? false;

    if (!isFormValid) {
      setState(() {
        autoValidateMode = AutovalidateMode.always;
      });
      return;
    }

    autoValidateMode = AutovalidateMode.disabled;
    context.read<ReviewCubit>().insertReview(
          InsertReviewRequest(
            review: reviewController.text.trim(),
            rate: userRating.toString(),
            cust: SharedPref.getInt(key: SharedPrefKeys.custCode),
          ),
        );
  }
}
