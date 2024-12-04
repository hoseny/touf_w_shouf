import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'phone_field.dart';
import 'regular_text_field.dart';

class AuthTextField extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool isPhoneField;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final AutovalidateMode? autoValidateMode;

  const AuthTextField({
    super.key,
    required this.hintText,
    this.isPassword = false,
    required this.controller,
    this.validator,
    this.isPhoneField = false,
    this.onChanged,
    this.keyboardType,
    this.autoValidateMode,
  });

  @override
  AuthTextFieldState createState() => AuthTextFieldState();
}

class AuthTextFieldState extends State<AuthTextField> {
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
          PhoneField(
            hintText: widget.hintText,
            controller: widget.controller,
            validator: widget.validator,
            onChanged: widget.onChanged,
            countryFlag: _countryFlag,
            showCountryPicker: _showCountryPicker,
            autoValidateMode: widget.autoValidateMode,
          )
        else
          RegularTextField(
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
