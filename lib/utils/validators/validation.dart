
class EValidator {
  static String? validateEmptyText(String fieldname, String? value){
      if(value == null || value.isEmpty){
        return '$fieldname is required';
      }
  }
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }

    //Regular Expression for email validation
    final emailRegExp = RegExp(r'^[\w\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address';
    }
    return null;
  }
  static String? validatePassword(String? value){
  if(value == null || value.isEmpty) {
      return "Password is required";
    }

  if(value.length <6){
    return "Password must be at least 6 characters";
  }

  if(!value.contains(RegExp(r'[A-Z]'))){
    return "Password must contain at least one Uppercase letter";
  }

  if(!value.contains(RegExp(r'[0-9]'))){
    return "Password must contain at least one one letter";
  }
  return null;
  }

  static String? validatePhoneNumber(String? value){
    if(value == null || value.isEmpty){
      return "Phone Number is required";
    }

    final phoneRegExp = RegExp(r'^\d{11}$');

    if(!phoneRegExp.hasMatch(value)){
      return 'Invalid Phone Number (10 digits required)';
    }

    return null;
  }
}
