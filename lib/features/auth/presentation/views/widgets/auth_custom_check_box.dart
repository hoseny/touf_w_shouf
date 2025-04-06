import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';

class AuthCustomCheckBox extends StatefulWidget {
  const AuthCustomCheckBox({
    super.key,
    required this.isChecked,
    required this.onChanged,
    required this.textSpans,
  });

  final bool isChecked;
  final ValueChanged<bool>? onChanged;
  final List<TextSpan> textSpans;
  @override
  State<AuthCustomCheckBox> createState() => _AuthCustomCheckBoxState();
}

class _AuthCustomCheckBoxState extends State<AuthCustomCheckBox> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.isChecked;
  }

  void _onCheckboxChanged(bool? newValue) {
    setState(() {
      _isChecked = newValue ?? false;
    });
    widget.onChanged?.call(_isChecked);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Checkbox(
            value: _isChecked,
            onChanged: _onCheckboxChanged,
            checkColor: Colors.white,
            activeColor: AppColors.primaryBlue,
            side: BorderSide(color: AppColors.lightGrey, width: 1.3.w),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: TextStyles.font14Grey600Regular,
                children: widget.textSpans,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
