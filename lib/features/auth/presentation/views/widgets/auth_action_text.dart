import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';

class AuthActionText extends StatelessWidget {
  final String initialText;
  final String actionText;
  final VoidCallback onActionTap;

  const AuthActionText({
    super.key,
    required this.initialText,
    required this.actionText,
    required this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
              style: TextStyles.font14Grey700Medium,
              children: [
                TextSpan(text: initialText),
                TextSpan(
                  text: " $actionText",
                  style: TextStyles.font14Blue500Bold,
                  recognizer: TapGestureRecognizer()..onTap = onActionTap,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
