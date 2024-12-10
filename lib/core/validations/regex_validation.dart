class RegexValidation {
  static bool isUsernameValid(String username) {
    return RegExp(r'^[a-zA-Z0-9_ ]+$').hasMatch(username);
  }

  static bool isEmailValid(String email) {
    return RegExp(r'^.+@[a-zA-Z]+\.[a-zA-Z]+(\.[a-zA-Z]+)*\s*$').hasMatch(email);
  }

  static bool isPasswordValid(String password) {
    return RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$").hasMatch(password);
  }

  static bool isPhoneNumberValid(String phoneNumber) {
    return RegExp(r'^(010|011|012|015)[0-9]{8}$').hasMatch(phoneNumber);
  }

  static bool hasLowerCase(String password) {
    return RegExp(r'^(?=.*[a-z])').hasMatch(password);
  }

  static bool hasUpperCase(String password) {
    return RegExp(r'^(?=.*[A-Z])').hasMatch(password);
  }

  static bool hasNumber(String password) {
    return RegExp(r'^(?=.*?[0-9])').hasMatch(password);
  }

  static bool hasSpecialCharacter(String password) {
    return RegExp(r'^(?=.*?[#?!@$%^&*-])').hasMatch(password);
  }

  static bool hasMinLength(String password) {
    return RegExp(r'^(?=.{8,})').hasMatch(password);
  }

  // Validate Visa Card Number (16 digits starting with 4)
  static bool isVisaCardNumberValid(String cardNumber) {
    return RegExp(r'^4[0-9]{15}$').hasMatch(cardNumber);
  }

  // Validate Expiration Date (MM/YY format)
  static bool isExpirationDateValid(String expirationDate) {
    return RegExp(r'^(0[1-9]|1[0-2])\/([0-9]{2})$').hasMatch(expirationDate);
  }

  // Validate CVV (3 digits)
  static bool isCvvValid(String cvv) {
    return RegExp(r'^[0-9]{3}$').hasMatch(cvv);
  }

  // Validate Cardholder's Name (Only letters and spaces)
  static bool isCardholderNameValid(String name) {
    return RegExp(r'^[a-zA-Z\s]+$').hasMatch(name);
  }
}
