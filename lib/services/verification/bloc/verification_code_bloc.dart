import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sophie_messenger_app/core/validator.dart';
import 'package:sophie_messenger_app/handlers/shared_handler.dart';
import 'package:sophie_messenger_app/routers/routers.dart';
import 'package:sophie_messenger_app/services/verification/bloc/verification_state.dart';

import '../../../routers/navigator.dart';

class VerifictionCodeBloc extends Cubit<verificationState> with Validations {
  VerifictionCodeBloc() : super(verificationInitialState());

  //=====================================================================
  //===================================================================== Veriables
  //=====================================================================
  TextEditingController codeController = TextEditingController();

  String codeError = '';
  bool codeIsValid = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String smsCode = '';
  String? verificationId;
  //=============================
  // Map<String, dynamic> requestData;
  //=====================================================================
  //===================================================================== Functions
  //=====================================================================
  DocumentReference userRef = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid.toString());

  bool validate() {
    codeError = isValidCode(codeController.text);
    codeIsValid = codeError.isEmpty;
    return codeIsValid;
  }
//  var PhoneNumber= FirebaseFirestore.instance
//         .collection('users')
//         .doc(FirebaseAuth.instance.currentUser!.uid.toString())
//         .collection('')
//         .get()
//         .then((QuerySnapshot querySnapshot) {
//       querySnapshot.docs.forEach((doc) {
//         var q = doc["phone"];

//       });

//     });

  // Future<void> sendVerificationCode(
  //     {required String PhoneNumber, required String codecontry}) async {
  //   print("PhoneNumber: $PhoneNumber");
  //   print("codecontry: $codecontry");
  //   var phoneee = codecontry + PhoneNumber;
  //   print(phoneee);

  //   await _auth.verifyPhoneNumber(
  //     phoneNumber: phoneee,
  //     verificationCompleted: (PhoneAuthCredential credential) async {
  //       // Auto-verification completed (only applicable on certain devices)
  //       await _auth.signInWithCredential(credential);

  //       // Handle the signed-in user if needed
  //       print("Done");
  //       CustomNavigator.push(Routes.verfication);
  //     },
  //     verificationFailed: (FirebaseAuthException e) {
  //       // Verification failed
  //       print('Verification failed: ${e.message}');
  //     },
  //     codeSent: (String verificationId, int? resendToken) async {
  //       // Code sent to the provided phone number
  //       // Save the verification ID for later use
  //       // Retrieve the SMS code entered by the user
  //       this.verificationId = verificationId;
  //       print("verificationId: $verificationId");
  //       // await verifyPhoneNumber(verificationId, smsCode);
  //     },
  //     codeAutoRetrievalTimeout: (String verificationId) {
  //       // Auto-retrieval timeout
  //       // Handle the timeout if needed
  //     },
  //   );

  // }

  Future<void> sendVerificationCode(
      {required String PhoneNumber, required String codecontry}) async {
    // ...
    print("PhoneNumber: $PhoneNumber");
    print("codecontry: $codecontry");
    var phoneee = codecontry + PhoneNumber;
    print(phoneee);
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneee,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // ...
      },
      verificationFailed: (FirebaseAuthException e) {
        // ...
      },
      codeSent: (String verificationId, int? resendToken) async {
        this.verificationId = verificationId;
        SharedHandler.instance!.setData("very", value: verificationId);
        print("verificationId: $verificationId");
       await verifyPhoneNumber(verificationId, codeController.text);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // ...
      },
    );
  }

  Future<void> verifyPhoneNumber(verificationId, String smsCode) async {
    try {
      // if (validate()) {

      // }
      var very = SharedHandler.instance!
          .getData(key: "very", valueType: ValueType.string);
      Map<String, dynamic> data = {
        "code": codeController.text,
      };
      

      print("code: ${codeController.text}");
      print("smsCode: ${codeController.text}");
      print("verificationId22: ${very}");
      PhoneAuthCredential credential = await PhoneAuthProvider.credential(
        verificationId: very,
        smsCode: codeController.text,
      );
      await _auth.signInWithCredential(credential).then((value) {
        if (value.user != null) {
          CustomNavigator.push(Routes.login);
        }
      });

      // Handle the signed-in user if needed
    } catch (e) {
      print('Phone number verification failed: $e');
    }
  }
}

//   Future<void> sendVerificationCodeee() async {
//     try {
//       // bool validate() {
//       //   codeError = isValidCode(codeController.text);
//       //   codeIsValid = codeError.isEmpty;
//       //   return codeIsValid;
//       // }
//       var user = FirebaseAuth.instance.currentUser;
//       if (user != null) {
//         var userEmail = user.email;
//         print(userEmail);
//         EmailOTP myauth = EmailOTP();
//         await myauth.setConfig(
//             appEmail: 'fatmaalzhraazedan@gmail.com',
//             appName: 'Sophie App',
//             otpLength: 4,
//             userEmail: 'fatmaalzhraazedan@gmail.com',
//             otpType: OTPType.digitsOnly);
//         print("Wait");
//         if (await myauth.sendOTP() == true) {
//           print("send suceesfully");
//           // myauth.verifyOTP(otp: 8264);
//           emit(verificationSuccess(
//               errorMessege: 'Verification code send successfully'));
//         } else {
//           print("send Failura");
//           emit(verificationFailure(errorMessege: 'Failed send Otp'));
//         }
//       }
//     } catch (e, stackTrace) {
//       print("Failed to send OTP: $e");
//       print(stackTrace);
//     }
//   }
// }


// class VerifictionCodeBloc extends Cubit<verificationState> with Validations {
//   VerifictionCodeBloc() : super(verificationInitialState());

//   //=====================================================================
//   //===================================================================== Veriables
//   //=====================================================================
//   TextEditingController codeController = TextEditingController();

//   String codeError = '';
//   bool codeIsValid = false;
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   String smsCode = '';
//   //=============================
//   // Map<String, dynamic> requestData;
//   //=====================================================================
//   //===================================================================== Functions
//   //=====================================================================
//   DocumentReference userRef = FirebaseFirestore.instance
//       .collection('users')
//       .doc(FirebaseAuth.instance.currentUser!.uid.toString());

//   bool validate() {
//     codeError = isValidCode(codeController.text);
//     codeIsValid = codeError.isEmpty;
//     return codeIsValid;
//   }
// //  var PhoneNumber= FirebaseFirestore.instance
// //         .collection('users')
// //         .doc(FirebaseAuth.instance.currentUser!.uid.toString())
// //         .collection('')
// //         .get()
// //         .then((QuerySnapshot querySnapshot) {
// //       querySnapshot.docs.forEach((doc) {
// //         var q = doc["phone"];

// //       });

// //     });
//   String verificationId='';
//   Future<void> sendVerificationCode(
//       {required String PhoneNumber, required String codecontry}) async {
//     print("PhoneNumber: $PhoneNumber");
//     print("codecontry: $codecontry");
//     var phoneee = codecontry + PhoneNumber;
//     print(phoneee);

//     await _auth.verifyPhoneNumber(
//       phoneNumber: phoneee,
//       verificationCompleted: (PhoneAuthCredential credential) async {
//         // Auto-verification completed (only applicable on certain devices)
//         await _auth.signInWithCredential(credential);

//         // Handle the signed-in user if needed
//         print("Done");
//         CustomNavigator.push(Routes.verfication);
//       },
//       verificationFailed: (FirebaseAuthException e) {
//         // Verification failed
//         print('Verification failed: ${e.message}');
//       },
//       codeSent: (String verificationId, int? resendToken) async {
//         // Code sent to the provided phone number
//         // Save the verification ID for later use
//         // Retrieve the SMS code entered by the user
//         this.verificationId = verificationId;
//         print(ver)
//         // await verifyPhoneNumber(verificationId, smsCode);
//       },
//       codeAutoRetrievalTimeout: (String verificationId) {
//         // Auto-retrieval timeout
//         // Handle the timeout if needed
//       },
//     );
//   }

//   Future<void> verifyPhoneNumber(verificationId, String smsCode) async {
//     try {
//       // if (validate()) {

//       // }
//       Map<String, dynamic> data = {
//         "code": codeController.text,
//       };
//       print("code: ${codeController.text}");
//       print("smsCode: ${codeController.text}");
//       print("verificationId: ${this.verificationId}");
//       PhoneAuthCredential credential = PhoneAuthProvider.credential(
//         verificationId: this.verificationId,
//         smsCode: smsCode,
//       );
//       await _auth.signInWithCredential(credential);
//       CustomNavigator.push(Routes.login);
//       // Handle the signed-in user if needed
//     } catch (e) {
//       print('Phone number verification failed: $e');
//     }
//   }
//   // veifiy(){
//   //   verifyPhoneNumber(verificationId,  smsCode);
//   // }

//   // var user = FirebaseAuth.instance.currentUser;
//   // Future<void> sendVerificationCode() async {
//   //   try {
//   //     bool _validate() {
//   //       codeError = isValidCode(codeController.text);
//   //       codeIsValid = codeError.isEmpty;
//   //       return codeIsValid;
//   //     }

//   //     if (user != null) {
//   //       var userEmail = user!.email;
//   //       // Use userEmail to send the verification code via email
//   //       await FirebaseAuth.instance.sendPasswordResetEmail(email: userEmail!);
//   //       emit(verificationSuccess(errorMessege: 'code send Sucessfully'));
//   //       print('Verification code sent to email');
//   //     } else {
//   //       // User is not signed in or currentUser is null
//   //     }

//   //     CustomNavigator.push(Routes.home);
//   //   } catch (e) {
//   //     print('Error sending verification code: $e');
//   //   }
//   // }
//   // requestCode() => VerificationRepo().requestCode({});
//   // _update(AppEvents event, Emitter emit) => emit(Start());
//   // verify(AppEvents event, Emitter emit) async {
//   //   emit(Loading());
//   //   if (_validate()) {
//   //     Map<String, dynamic> data = {
//   //       "code": codeController.text,
//   //     }..addAll(requestData);

//   //   } else {
//   //     emit(Empty());
//   //   }
//   // }

//   // void click() {

//   // }
// }

// class VerifictionCodeBloc extends Cubit<verificationState> with Validations {
//   VerifictionCodeBloc() : super(verificationInitialState());

//   TextEditingController codeController = TextEditingController();
//   String codeError = '';
//   bool codeIsValid = false;

//   Future<void> sendVerificationCode() async {
//     try {
//       bool validate() {
//         codeError = isValidCode(codeController.text);
//         codeIsValid = codeError.isEmpty;
//         return codeIsValid;
//       }

//       var user = FirebaseAuth.instance.currentUser;
//       if (user != null) {
//         var userEmail = user.email;
//         if (validate()) {
//           // Use userEmail to send the verification code via email
//           // await FirebaseAuth.instance.sendPasswordResetEmail(email: userEmail!);
//           // emit(verificationSuccess(errorMessege: 'Code sent successfully'));
//           // print('Verification code sent to email');
//           // CustomNavigator.push(Routes.home);

//           var pinCode = generatePinCode();

//           // Send the PIN code to the user's email
//           await sendPinCode(userEmail!, pinCode.toString());

//           // Store the PIN code for later verification
//           storePinCode(user.uid, pinCode.toString());

//           emit(verificationSuccess(errorMessege: 'PIN code sent successfully'));
//           print('PIN code sent to email');
//           CustomNavigator.push(Routes.home);
//         } else {
//           emit(verificationFailure(errorMessege: 'Invalid code'));
//         }
//       } else {
//         emit(VerificationError(errorMessege: 'User is not signed in'));
//       }
//     } catch (e) {
//       print('Error sending verification code: $e');
//       emit(VerificationError(errorMessege: 'Error sending verification code'));
//     }
//   }

//   int generatePinCode() {
//     // Generate a random 4-digit PIN code
//     var random = Random();
//     return random.nextInt(9000) + 1000;
//   }

//   Future<void> sendPinCode(String email, String pinCode) async {
//     try {
//       // Send the email using Firebase Functions or your own email service
//       // Example using Firebase Functions:
//       await FirebaseAuth.instance.useAuthEmulator('localhost',8000); // Use this line if testing locally with Firebase Emulator Suite
//       await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
//     } catch (e) {
//       print('Error sending email: $e');
//       throw Exception('Failed to send verification email.');
//     }
//   }

//   void storePinCode(String userId, String pinCode) {
//     try {
//       // Store the PIN code in Firestore associated with the user's ID
//       FirebaseFirestore.instance.collection('pin_codes').doc(userId).set({
//         'pin_code': pinCode,
//       });
//     } catch (e) {
//       print('Error storing pin code: $e');
//       throw Exception('Failed to store PIN code.');
//     }
//   }
// }

// class VerifictionCodeBloc extends Cubit<verificationState> with Validations {
//   VerifictionCodeBloc() : super(verificationInitialState());
//   TextEditingController codeController = TextEditingController();
//   String codeError = '';
//   bool codeIsValid = false;
//   Future<void> sendVerificationCode() async {
//     try {
//       // bool validate() {
//       //   codeError = isValidCode(codeController.text);
//       //   codeIsValid = codeError.isEmpty;
//       //   return codeIsValid;
//       // }
//       var user = FirebaseAuth.instance.currentUser;
//       if (user != null) {
//         var userEmail = user.email;
//         print(userEmail);
//        EmailOTP myauth = EmailOTP();
//        await myauth.setConfig(
//             appEmail: 'fatmaalzhraazedan@gmail.com',
//             appName: 'Sophie App',
//             otpLength: 4,
//             userEmail: userEmail,
//             otpType: OTPType.digitsOnly);
//             print("Wait");
//         if (await myauth.sendOTP() ==  true) {
//           print("send suceesfully");
//           emit(verificationSuccess(
//               errorMessege: 'Verification code send successfully'));
//         } else {
//           print("send Failura");
//           emit(verificationFailure(errorMessege: 'Failed send Otp'));
//         }
//       }
//     } catch (e, stackTrace) {
//       print("Failed to send OTP: $e");
//       print(stackTrace);
//     }
//   }
// }
