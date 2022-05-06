class FieldValidator {

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return "Please Enter Email";
    } else if (!RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
        .hasMatch(value)) {
      return "Invalid Email";
    } else {
      return null;
    }
  }
  String? validateWeight(String value) {
    if (value.isEmpty) {
      return 'Please Enter Weight';
    }
    return null;
  }

  String? validateMeasurement(String value) {
    if (value.isEmpty) {
      return 'Please Enter Measurement';
    }
    return null;
  }

  String? validateHeight(String value) {
    if (value.isEmpty) {
      return 'Please Enter Height';
    }
    return null;
  }

  String ? validatePassword(String value) {
    if (value.isEmpty) {
      return "Please Enter Password";
    } else if (value.length < 6) {
      return "Length should be 6 character";
    } else {
      return null;
    }
  }

  String ? validateConfirmPassword(String value, String value2) {
    if (value.isEmpty) {
      return "Please Enter Password";
    } else if(value != value2) {
      return "Password & confirm password are not same!";
    }
    else if (value.length < 6) {
      return "Length should be 6 character";
    } else {
      return null;
    }
  }

  String? validateName(String value) {
    if (value.isEmpty) {
      return 'Please Enter name';
    }
    return null;
  }

  String? validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    // Indian Mobile number are of 10 digit only
    if (value.isEmpty) {
      return "Please Enter Mobile Number";
    } else if (value.length < 10) {
      // return 'Mobile Number Must be of 10 Digit';
      return 'Enter Valid Mobile Number';
    } else if (!regExp.hasMatch(value)) {
      return 'Only Numeric Character Should be Allow';
    } else {
      return null;
    }
  }
}
