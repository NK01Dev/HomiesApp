class AppValidators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }
    // Basic email regex
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  static String? validateConfirmPassword(String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Confirm password cannot be empty';
    }
    if (password != confirmPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name cannot be empty';
    }
    return null;
  }

  static String? validateMonthlyRent(String? value) {
    if (value == null || value.isEmpty) {
      return 'Monthly rent cannot be empty';
    }
    if (double.tryParse(value) == null || double.parse(value) <= 0) {
      return 'Enter a valid positive number';
    }
    return null;
  }

  static String? validateNumberOfRooms(String? value) {
    if (value == null || value.isEmpty) {
      return 'Number of rooms cannot be empty';
    }
    if (int.tryParse(value) == null || int.parse(value) <= 0) {
      return 'Enter a valid positive integer';
    }
    return null;
  }
}