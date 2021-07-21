class EmailFieldValidator {
  static String? validate(value) {
    return value.isEmpty ? 'Email can\'t be empty' : null;
  }
}

class PasswordFieldValidator {
  static String? validate(value) {
    return value.isEmpty ? 'Password can\'t be empty' : null;
  }
}