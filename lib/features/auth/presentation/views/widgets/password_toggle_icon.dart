import 'package:flutter/material.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';

class PasswordToggleIcon extends StatelessWidget {
  final VoidCallback togglePasswordVisibility;

  const PasswordToggleIcon(this.togglePasswordVisibility);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.visibility_outlined,
        color: AppColors.mediumGrey,
      ),
      onPressed: togglePasswordVisibility,
    );
  }
}
