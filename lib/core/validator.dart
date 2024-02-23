mixin Validations {
  String isValidEmail(String email) {
    if (email.isEmpty) {
      return "Please Enter Email Correctly";
    } else if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      return "Please Enter Email";
    }
    return "";
  }
  String isValidPassword(String password) {
    if (password.isEmpty) {
      return "Please Enter Password";
    } else if (password.length < 8) {
      return "Password should be greater than 8 Letters";
    }
    return "";
  }

  String isValidPhone(String phone) {
    //RegExp(r"^(?:[+0]9)?[0-9]{9}$").hasMatch(phone) &&
    // r"^(?:\+|0)[0-9]{9,}$",
    if (phone.isEmpty) {
      return "Please Enter Your Phone Number";
    } else if (RegExp(r"^(?:[+0]9)?[0-9]{9}$").hasMatch(phone)) {
      print('validate');
      return "Please Enter Phone Number Contain 10 Digits";
    }
    return "";
  }

  String isValidConfirmPassword(String password, String confirmPassword) {
    if (confirmPassword.isEmpty) {
      return "Please Enter Confirm Password";
    } else if (confirmPassword != password) {
      return "Passwords Are Not Identical";
    }
    return "";
  }

  String isValidCode(String code) {
    if (code.isEmpty) {
      return "Please Enter The Code";
    } else if (code.length != 6) {
      return "Code should be Exactly 6 Digits";
    }
    return "";
  }

  String isValidName(String name) {
    if (name.isEmpty) {
      return "Please Enter Your Name";
    } else if (name.length < 3) {
      return "Name should contain at Least 3 Letters";
    }
    return "";
  }
}
