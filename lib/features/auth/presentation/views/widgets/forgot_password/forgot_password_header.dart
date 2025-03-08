import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/helpers/helpers_methods.dart';
import 'package:touf_w_shouf/core/helpers/locale_keys.dart';
import 'package:touf_w_shouf/core/resources/assets.dart';
import 'package:touf_w_shouf/features/auth/presentation/views/widgets/auth_header.dart';

class ForgotPasswordHeader extends StatelessWidget {
  const ForgotPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthHeader(
      imageAsset: Assets.forgetpass,
      title: context.tr(LocaleKeys.authForgot),
      subtitle: isEnglish(context)
          ? 'Don’t worry! It happens. Please enter the email address associated with your account.'
          : 'لا تقلق! يحدث هذا. يرجى إدخال عنوان البريد الإلكتروني المرتبط بحسابك',
      imageHeight: 328.89.h,
      titleSpacing: 12.h,
      subtitleSpacing: 8.h,
    );
  }
}
