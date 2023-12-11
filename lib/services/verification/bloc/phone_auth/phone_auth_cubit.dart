import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sophie_messenger_app/core/validator.dart';
import 'package:sophie_messenger_app/handlers/shared_handler.dart';
import 'package:sophie_messenger_app/services/verification/bloc/phone_auth/phone_auth_state.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> with Validations {
  late String? verificationId;
  PhoneAuthCubit() : super(PhoneAuthInitial());

  TextEditingController codeContrryController = TextEditingController();
  TextEditingController PhoneNumberController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  String phoneError = '';
  bool phoneIsValid = true;
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  bool validate() {
    phoneError = isValidPhone(PhoneNumberController.text);

    phoneIsValid = phoneError.isEmpty;

    return phoneIsValid;
  }

  Future<void> submitPhoneNumber() async {
    emit(Loading());

    try {
      if (validate()) {
        // Map<String, dynamic> data = {
        //   "phone": PhoneNumberController.text,
        // };
        //add to firestore
        var phonee = codeContrryController.text + PhoneNumberController.text;
        DocumentReference userRef = FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid.toString());
        await userRef.update({"phone": phonee}).then((value) {
          print("Field updated successfully");
        }).catchError((error) {
          emit(PhoneFailure(errorMessege: 'Failed to add phone Try Again!'));
          print("Failed to update field: $error");
        });
        //end

        await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: phonee,
          timeout: const Duration(seconds: 14),
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
        );
      } else {
        emit(PhoneFailure(errorMessege: 'Please Enter Valid Phone Number'));
      }
    } on FirebaseAuthException catch (ex) {
      emit(PhoneFailure(errorMessege: 'something went Wrong!'));
      print("something went Wrong $ex");
    }
    emit(Loading());
  }

  void verificationCompleted(PhoneAuthCredential credential) async {
    print('verificationCompleted');
    await signIn(credential);
  }

  void verificationFailed(FirebaseAuthException error) {
    print('verificationFailed : ${error.toString()}');
    emit(ErrorOccurred(errorMsg: error.toString()));
  }

  void codeSent(String verificationId, int? resendToken) async {
    print('codeSent');
    await SharedHandler.instance!.setData("very", value: verificationId);
    print("verificationId: $verificationId");
    this.verificationId = verificationId;
    emit(PhoneNumberSubmited());
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    print('codeAutoRetrievalTimeout');
  }

  Future<void> submitOTP(String otpCode) async {
    var very = SharedHandler.instance!
        .getData(key: "very", valueType: ValueType.string);
    PhoneAuthCredential credential =
        PhoneAuthProvider.credential(verificationId: very, smsCode: otpCode);

    await signIn(credential);
  }

  Future<void> signIn(PhoneAuthCredential credential) async {
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final userRef =
            FirebaseFirestore.instance.collection('users').doc(user.uid);

        await userRef.update({"isVerified": true}).then((value) {
          print("Field updated successfully");

          // Introduce a delay of 1 second (adjust as needed)
          const delayDuration = Duration(seconds: 1);
          return Future.delayed(delayDuration);
        }).then((_) {
          // Check the Firestore document after the delay
          userRef.get().then((documentSnapshot) {
            if (documentSnapshot.exists) {
              var isVerified = documentSnapshot.data()!['isVerified'];
              print("isVerified: $isVerified");
            } else {
              print("Document does not exist");
            }
          }).catchError((error) {
            print("Error retrieving document: $error");
          });
        }).catchError((error) {
          emit(
              verificationFailure(errorMessege: 'Failed to Verify Try Again!'));
          print("Failed to update field: $error");
        });
      } else {
        print("User is null");
      }
    } catch (error) {
      emit(verificationFailure(
          errorMessege: 'Failed to sign in with credential'));
      print("Error signing in with credential: $error");
    }
     emit(PhoneOTPVerified());
  }
//       DocumentReference userRef =await FirebaseFirestore.instance
//           .collection('users')
//           .doc(FirebaseAuth.instance.currentUser!.uid.toString());
//   //     await userRef
//   //         .set({"isVerified": true}, SetOptions(merge: true)).then((value) {
//   //       print("Field updated successfully");
//   //     }).catchError((error) {
//   //       emit(verificationFailure(errorMessege: 'Failed to Verify Try Again!'));
//   //       print("Failed to update field: $error");
//   //     });

//   await userRef.update({"isVerified": true}).then((value) {
//   print("Field updated successfully");

//   // Introduce a delay of 1 second (adjust as needed)
//   const delayDuration = Duration(seconds: 1);
//   return Future.delayed(delayDuration);
// }).then((_) {
//   // Check the Firestore document after the delay
//   userRef.get().then((documentSnapshot) {
//     if (documentSnapshot.exists) {
//       var isVerified = documentSnapshot.data()['isVerified'];
//       print("isVerified: $isVerified");
//     } else {
//       print("Document does not exist");
//     }
//   }).catchError((error) {
//     print("Error retrieving document: $error");
//   });
// }).catchError((error) {
//   emit(verificationFailure(errorMessege: 'Failed to Verify Try Again!'));
//   print("Failed to update field: $error");
// });

  //   } catch (error) {
  //     emit(ErrorOccurred(errorMsg: error.toString()));
  //   }
  //  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  User getLoggedInUser() {
    User firebaseUser = FirebaseAuth.instance.currentUser!;
    return firebaseUser;
  }
}
