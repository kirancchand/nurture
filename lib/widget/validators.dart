class EmailFieldValidator {
  static String validate(value) {
    return value.isEmpty ? 'Email can\'t be empty' : null;
  }
}

class PasswordFieldValidator {
  static String validate(value) {
    return value.isEmpty ? 'Password can\'t be empty' : null;
  }
}

class OtpFieldValidator {
  static String validate(value) {
    return value.isEmpty ? 'Otp can\'t be empty' : null;
  }
}

class ConfirmOtpFieldFieldValidator {
  static String validate(value) {
    return value.isEmpty ? 'Confirm can\'t be empty' : null;
  }
}

class PinFieldValidator {
  static String validate(value) {
    return value.isEmpty ? 'Pin can\'t be empty' : null;
  }
}