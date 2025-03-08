import 'package:flutter/material.dart';
import 'package:touf_w_shouf/core/validations/regex_validation.dart';

class Validation {
  // Helper method to check if the current locale is English.
  static bool isEnglish(BuildContext context) {
    return Localizations.localeOf(context).languageCode == 'en';
  }

  static String? userNameValidator(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return isEnglish(context)
          ? "Username cannot be empty."
          : "اسم المستخدم لا يمكن أن يكون فارغاً.";
    }
    if (value.length <= 2) {
      return isEnglish(context)
          ? "Username should be at least 3 characters long."
          : "يجب أن يكون اسم المستخدم على الأقل 3 أحرف.";
    }
    if (value.length > 40) {
      return isEnglish(context)
          ? "Username cannot exceed 40 characters."
          : "اسم المستخدم لا يمكن أن يتجاوز 40 حرفاً.";
    }
    if (!RegexValidation.isUsernameValid(value)) {
      return isEnglish(context)
          ? "Please enter a valid username."
          : "يرجى إدخال اسم مستخدم صحيح.";
    }
    return null;
  }

  static String? emailValidator(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return isEnglish(context)
          ? 'Email address is required.'
          : 'البريد الإلكتروني مطلوب.';
    }
    if (!RegexValidation.isEmailValid(value)) {
      return isEnglish(context)
          ? 'Please enter a valid email address.'
          : 'يرجى إدخال بريد إلكتروني صحيح.';
    }
    return null;
  }

  static String? phoneNumberValidator(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return isEnglish(context)
          ? 'Phone number is required.'
          : 'رقم الهاتف مطلوب.';
    }
    if (value.length < 9 || value.length > 20) {
      return isEnglish(context)
          ? 'Please enter a valid phone number.'
          : 'يرجى إدخال رقم هاتف صحيح.';
    }
    return null;
  }

  static String? passwordValidator(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return isEnglish(context)
          ? 'Password is required.'
          : 'كلمة المرور مطلوبة.';
    }
    if (value.length < 8) {
      return isEnglish(context)
          ? 'Password should be at least 8 characters long.'
          : 'يجب أن تتكون كلمة المرور من 8 أحرف على الأقل.';
    }
    return null;
  }

  static String? passwordConfirmValidator(
      BuildContext context, String? value, String? password) {
    if (value == null || value.isEmpty) {
      return isEnglish(context)
          ? 'Password confirmation is required.'
          : 'تأكيد كلمة المرور مطلوب.';
    }
    if (value != password) {
      return isEnglish(context)
          ? 'Passwords do not match.'
          : 'كلمات المرور غير متطابقة.';
    }
    return null;
  }

  static String? loginPasswordValidator(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return isEnglish(context)
          ? 'Password is required.'
          : 'كلمة المرور مطلوبة.';
    }
    if (value.length < 8) {
      return isEnglish(context)
          ? 'Password should be at least 8 characters long.'
          : 'يجب أن تتكون كلمة المرور من 8 أحرف على الأقل.';
    }
    return null;
  }

  static String? validatePhoneOrEmail(BuildContext context, String? input) {
    if (input == null || input.isEmpty) {
      return isEnglish(context)
          ? 'Please enter your email or phone number'
          : 'يرجى إدخال بريدك الإلكتروني أو رقم هاتفك';
    }

    final emailRegex =
    RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    final phoneRegex = RegExp(r"^\+?[0-9]{10,15}$");

    if (emailRegex.hasMatch(input)) {
      return null; // Valid email
    } else if (phoneRegex.hasMatch(input)) {
      return null; // Valid phone number
    } else {
      return isEnglish(context)
          ? 'Please enter a valid email or phone number'
          : 'يرجى إدخال بريد إلكتروني أو رقم هاتف صحيح';
    }
  }

  static String? cardNumberValidator(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return isEnglish(context)
          ? 'Card number is required.'
          : 'رقم البطاقة مطلوب.';
    }
    if (!RegexValidation.isVisaCardNumberValid(value)) {
      return isEnglish(context)
          ? 'Please enter a valid Visa card number.'
          : 'يرجى إدخال رقم بطاقة فيزا صحيح.';
    }
    return null;
  }

  static String? expirationDateValidator(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return isEnglish(context)
          ? 'Expiration date is required.'
          : 'تاريخ الانتهاء مطلوب.';
    }
    if (!RegexValidation.isExpirationDateValid(value)) {
      return isEnglish(context)
          ? 'Please enter a valid expiration date (MM/YY).'
          : 'يرجى إدخال تاريخ انتهاء صالح (MM/YY).';
    }
    return null;
  }

  static String? cvvValidator(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return isEnglish(context)
          ? 'CVV is required.'
          : 'رمز التحقق مطلوب.';
    }
    if (!RegexValidation.isCvvValid(value)) {
      return isEnglish(context)
          ? 'Please enter a valid CVV (3 digits).'
          : 'يرجى إدخال رمز تحقق صحيح (3 أرقام).';
    }
    return null;
  }

  static String? cardholderNameValidator(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return isEnglish(context)
          ? 'Cardholder name is required.'
          : 'اسم صاحب البطاقة مطلوب.';
    }
    if (!RegexValidation.isCardholderNameValid(value)) {
      return isEnglish(context)
          ? 'Please enter a valid cardholder name (letters and spaces only).'
          : 'يرجى إدخال اسم صاحب بطاقة صالح (أحرف ومسافات فقط).';
    }
    return null;
  }
}
