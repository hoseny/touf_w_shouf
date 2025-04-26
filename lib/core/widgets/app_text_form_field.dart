import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'phone_input_field.dart';
import 'standard_input_field.dart';

class AppTextFormField extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool isPhoneField;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final AutovalidateMode? autoValidateMode;

  const AppTextFormField({
    super.key,
    required this.hintText,
    this.isPassword = false,
     this.controller,
    this.validator,
    this.isPhoneField = false,
    this.onChanged,
    this.keyboardType,
    this.autoValidateMode,
  });

  @override
  AppTextFormFieldState createState() => AppTextFormFieldState();
}

class AppTextFormFieldState extends State<AppTextFormField> {
  late bool _isObscured;
  String _countryFlag = "🇪🇬";

  @override
  void initState() {
    super.initState();
    _isObscured = widget.isPassword;
  }

  void _showCountryPicker() {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      onSelect: (Country country) {
        setState(() {
          _countryFlag = country.flagEmoji;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.isPhoneField)
          PhoneInputField(
            hintText: widget.hintText,
            controller: widget.controller,
            validator: widget.validator,
            onChanged: widget.onChanged,
            countryFlag: _countryFlag,
            showCountryPicker: _showCountryPicker,
            autoValidateMode: widget.autoValidateMode,
          )
        else
          StandardInputField(
            hintText: widget.hintText,
            controller: widget.controller,
            isPassword: widget.isPassword,
            validator: widget.validator,
            onChanged: widget.onChanged,
            keyboardType: widget.keyboardType,
            autoValidateMode: widget.autoValidateMode,
            isObscured: _isObscured,
            togglePasswordVisibility: () {
              setState(() {
                _isObscured = !_isObscured;
              });
            },
          ),
      ],
    );
  }
}
