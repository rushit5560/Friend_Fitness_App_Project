class FieldValidator {

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return "Please enter email";
    } else if (!RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
        .hasMatch(value)) {
      return "Invalid email";
    } else {
      return null;
    }
  }

  String? validateOtp(String value) {
    if (value.isEmpty) {
      return "Please enter otp";
    }  else {
      return null;
    }
  }
  String? validateWeight(String value) {
    if (value.isEmpty) {
      return 'Please enter weight';
    }
    return null;
  }

  String? validateChest(String value) {
    if (value.isEmpty) {
      return 'Please Enter Chest Measurement';
    }
    return null;
  }

  String? validateLeftArm(String value) {
    if (value.isEmpty) {
      return 'Please Enter Left Arm Measurement';
    }
    return null;
  }

  String? validateRightArm(String value) {
    if (value.isEmpty) {
      return 'Please Enter Right Arm Measurement';
    }
    return null;
  }

  String? validateWaist(String value) {
    if (value.isEmpty) {
      return 'Please Enter Waist Measurement';
    }
    return null;
  }

  String? validateHips(String value) {
    if (value.isEmpty) {
      return 'Please Enter Hips Measurement';
    }
    return null;
  }

  String? validateLeftThight(String value) {
    if (value.isEmpty) {
      return 'Please Enter Left Thigh Measurement';
    }
    return null;
  }

  String? validateRightThight(String value) {
    if (value.isEmpty) {
      return 'Please Enter Right Thigh Measurement';
    }
    return null;
  }

  String? validateHeight(String value) {
    if (value.isEmpty) {
      return 'Please enter height';
    }
    return null;
  }

  String ? validatePassword(String value) {
    if (value.isEmpty) {
      return "Please enter password";
    } else if (value.length < 8) {
      return "Length should be 8 character";
    } else {
      return null;
    }
  }

  String ? validateConfirmPassword(String value, String value2) {
    if (value.isEmpty) {
      return "Please enter password";
    } else if(value != value2) {
      return "Password & confirm password are not same!";
    }
    else if (value.length < 8) {
      return "Password length should be minimum 8 character";
    } else {
      return null;
    }
  }

  String? validateName(String value) {
    if (value.isEmpty) {
      return 'Please enter name';
    }
    return null;
  }

  String? validateAddress(String value) {
    if (value.isEmpty) {
      return 'Please enter address';
    }
    return null;
  }

  String? validateDay(String value) {
    if (value.isEmpty) {
      return 'Please enter day';
    }
    return null;
  }

  String? validatePerson(String value) {
    if (value.isEmpty) {
      return 'Please enter total person';
    }
    return null;
  }

  String? validateAmount(String value) {
    if (value.isEmpty) {
      return 'Please enter amount';
    }
    return null;
  }

  String? validateRewardPoint(String value) {
    if (value.isEmpty) {
      return 'Please enter reward point';
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
