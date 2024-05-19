class Validator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }
    // Regular expression for validating email
    final emailRegex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\\.,;:\s@\"]+\.)+[^<>()[\]\\.,;:\s@\"]{2,})$');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null; // Return null if the input is valid
  }

  static String? validatePasswordField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }

    return null; // Return null if the input is valid
  }

  static String? validatePhoneNumber(String? value) {
    final RegExp numberRegExp = RegExp(r'^[0-9]+$');

    if (value == null || value.isEmpty) {
      return 'Phone number cannot be empty';
    } else if (!numberRegExp.hasMatch(value)) {
      return 'Phone number must contain only digits';
    } else if (value.length < 5) {
      return 'Phone number must not be less than 5 digits';
    }

    return null; // Return null if the input is valid
  }

  static String? validateStrongPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    // Check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }
    // Check for lowercase letters
    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one lowercase letter';
    }
    // Check for digits
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
    }
    // Check for special characters
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character';
    }
    return null; // Return null if the input is valid
  }

  static String? validateCardNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Card number cannot be empty';
    }
    if (value.length != 16) {
      return 'Card number must be 16 digits long';
    }

    return null; // Return null if the input is valid
  }

  static String? validateReEnterPasswordField(
      String? value, String firstPassword) {
    if (value != firstPassword || value!.isEmpty) {
      return "Passwords are not matching";
    }

    return null; // Return null if the input is valid
  }

  static String? validateNotEmptyField(String? value, String errorMsg) {
    if (value == null || value.isEmpty) {
      return errorMsg;
    }

    return null; // Return null if the input is valid
  }
}
