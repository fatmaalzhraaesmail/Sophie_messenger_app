import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sophie_messenger_app/routers/navigator.dart';
import 'package:sophie_messenger_app/routers/routers.dart';
import 'package:sophie_messenger_app/services/verification/bloc/verification_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/validator.dart';

class EmailVerificationCubit extends Cubit<verificationState> with Validations {
  EmailVerificationCubit() : super(verificationInitialState());

  //=====================================================================
  //===================================================================== Veriables
  //=====================================================================
  TextEditingController codeController = TextEditingController();

  String codeError = '';
  bool codeIsValid = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String smsCode = '';
  String? verificationId;
  EmailOTP myauth = EmailOTP();

  //=============================
  // Map<String, dynamic> requestData;
  //=====================================================================
  //===================================================================== Functions
  //=====================================================================
  // DocumentReference userRef = FirebaseFirestore.instance
  //     .collection('users')
  //     .doc(FirebaseAuth.instance.currentUser!.uid.toString());
  // var userEmail = FirebaseFirestore.instance
  //     .collection('users')
  //     .doc(FirebaseAuth.instance.currentUser!.uid.toString())
  //     .collection('')
  //     .get()
  //     .then((QuerySnapshot querySnapshot) {
  //   querySnapshot.docs.forEach((doc) {
  //     var q = doc["email"];
  //   });
  // });
  var user = FirebaseAuth.instance.currentUser;

  bool validate() {
    codeError = isValidCode(codeController.text);
    codeIsValid = codeError.isEmpty;
    return codeIsValid;
  }

  Future<void> sendVerificationCodeee() async {
    try {
      bool validate() {
        codeError = isValidCode(codeController.text);
        codeIsValid = codeError.isEmpty;
        return codeIsValid;
      }

      var user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        var userEmail = user.email;
        print(userEmail);
        await myauth.setConfig(
          appEmail: 'fatmaalzhraazedan@gmail.com',
          appName: 'Sophie App',
          otpLength: 4,
          userEmail: userEmail,
          otpType: OTPType.digitsOnly,
        );
        print("Wait");
        if (await myauth.sendOTP() == true) {
          print("send suceesfully");
          emit(verificationSuccess(
              errorMessege: 'Verification code send successfully'));
        } else {
          print("send Failura");
          emit(verificationFailure(errorMessege: 'Failed send Otp'));
        }
      }
    } catch (e, stackTrace) {
      print("Failed to send OTP: $e");
      print(stackTrace);
    }
  }

  Future<void> verifyEmail() async {
    try {
      var verfyEmailOtpSend = codeController.text;
      print("verfyEmailOtpSend: $verfyEmailOtpSend");
      await myauth.verifyOTP(otp: verfyEmailOtpSend.trim());
      if (await myauth.verifyOTP(otp: verfyEmailOtpSend) == true) {
        print("OTP is verified");
        CustomNavigator.push(Routes.login);
        emit(verificationSuccess(errorMessege: 'Verification Done'));
      } else {
        print("Invalid OTP");
      }
    } catch (e, stackTrace) {
      print("Failed to send OTP: $e");
      print("ddddddddddd");
      print(stackTrace);
    }
  }
}
