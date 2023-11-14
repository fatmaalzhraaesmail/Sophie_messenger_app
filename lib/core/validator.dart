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
    if (phone.isEmpty) {
      return "Please Enter Your Phone Number";
    } else if (phone.length < 11) {
      return "Please Enter Phone Number Contain 11 Digits";
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

  String isValidCivilNumber(String civilNumber) {
    if (civilNumber.isEmpty) {
      return "الرجاء ادخال الرقم المدني";
    } else if (civilNumber.length != 14) {
      return "الرقم المدني يجب ان يتكون من 14 رقم";
    }
    return "";
  }

  String isCreditCardNumber(String creditNumber) {
    if (creditNumber.isEmpty) {
      return "الرجاء ادخال رقم البطاقة";
    } else if (creditNumber.length != 16) {
      return "رقم البطاقة يجب ان يتكون من 16 رقم";
    }
    return "";
  }

  String isValidCvvNumber(String cvvNumber) {
    if (cvvNumber.isEmpty) {
      return "الرجاء ادخال رقم السي في في";
    } else if (cvvNumber.length != 3) {
      return "رقم السي في في يجب ان يتكون من 3 ارقام";
    }
    return "";
  }
}
