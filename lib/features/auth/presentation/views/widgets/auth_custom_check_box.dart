import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touf_w_shouf/core/resources/colors.dart';
import 'package:touf_w_shouf/core/resources/styles.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({
    Key? key,
    required this.mainText,
    this.highlightedParts = const [],
    this.isChecked = false,
    this.onChanged,
  }) : super(key: key);

  final String mainText;
  final List<String> highlightedParts;
  final bool isChecked;
  final ValueChanged<bool>? onChanged;

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.isChecked;
  }

  void _handleCheckboxChange(bool? value) {
    setState(() {
      _isChecked = value ?? false;
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
            onChanged: _handleCheckboxChange,
            checkColor: Colors.white,
            activeColor: AppColors.primaryBlue,
            side: BorderSide(color: AppColors.lightGrey, width: 1.3.w),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.r)),
          ),
          SizedBox(width: 2.w),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: TextStyles.font14Grey600Medium,
                children: _buildRichTextParts(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<TextSpan> _buildRichTextParts() {
    final List<TextSpan> spans = [];
    final textParts = widget.mainText.split(' ');

    for (final part in textParts) {
      final isHighlighted = widget.highlightedParts.contains(part);
      spans.add(
        TextSpan(
          text: "$part ",
          style: isHighlighted
              ? TextStyles.font14Blue500Bold
              : TextStyles.font14Grey600Regular,
        ),
      );
    }
    return spans;
  }
}
