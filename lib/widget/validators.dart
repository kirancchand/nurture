class EmailFieldValidator {
  static String validate(value) {
    return value.isEmpty ? 'Email can\'t be emptyyy' : null;
/*
    if (value.isEmpty) {
      return 'Email can\'t be empty';
    }
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return 'Enter a valid Email address';
    }
    return null;*/
  }
}

class NameFieldValidator {
  static String validate(value) {
    return value.isEmpty ? 'Field can\'t be empty' : null;
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
