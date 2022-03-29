String? validateEmail(String value) {
  final validCharacters = RegExp(
      r'^(([^<>()[\]\\...,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,3}))$');
  if (value.length == 0) {
    return "Please enter Email Id";
  } else if (!validCharacters.hasMatch(value)) {
    return "Please enter valid Email Id";
  } else {
    return null;
  }
}

String? validatePassword(String value) {
  if (value.length == 0) {
    return "Please enter Password";
  } else if (value.length < 4) {
    return "Password require atleast 4 characters";
  }
  return null;
}
String? validateMobile(String value) {
  final patttern = RegExp(r'(^[6-9][0-9]*$)');
  if (value.length == 0) {
    return "Please enter Mobile Number";
  } else if (value.length != 10) {
    return "Mobile number must 10 digits";
  } else if (!patttern.hasMatch(value)) {
    return "Please enter valid Mobile Number";
  }
  return null;
}
String? validateDateOfBirth(String value)
{
  if(value.length == 0){
    return "Please enter date of birth";
  }else{
    return null;
  }
}

String? validateName(String value) {
  String pattern = r'[!@#<>?":_`~;[\]\\|=+"′″€₹£)(*&^%0-9-]';
  String patternS = r"[']";
  RegExp regExp = new RegExp(pattern);
  RegExp regExpS = new RegExp(patternS);
  if (value.length == 0) {
    return "Please enter Full Name";
  } else if (value.length < 2) {
    return "Name require atleast 2 characters";
  } else if (regExp.hasMatch(value)) {
    return "Special characters are not allowed in name";
  } else if (regExpS.hasMatch(value)) {
    return "Special characters are not allowed in name";
  }
  return null;
}