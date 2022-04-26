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
  String ? validatePassword(String value) {
    if (value.isEmpty) {
      return "Please Enter Password";
    } else if (value.length < 6) {
      return "Length should be 6 character";
    } else {
      return null;
    }
  }


}
