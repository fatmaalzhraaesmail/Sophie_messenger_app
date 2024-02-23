import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sophie_messenger_app/base/models/user_model.dart';
import 'package:sophie_messenger_app/core/validator.dart';
import 'package:sophie_messenger_app/handlers/shared_handler.dart';
import 'package:sophie_messenger_app/services/verification/bloc/phone_auth/phone_auth_state.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState>  with Validations {
   late String? verificationId;
  PhoneAuthCubit() : super(PhoneAuthInitial());
  /////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////// Variables
  /////////////////////////////////////////////////////////////
  TextEditingController codeContrryController = TextEditingController();
  TextEditingController PhoneNumberController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  String phoneError = '';
  bool phoneIsValid = true;
  ////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////// Functions
  ////////////////////////////////////////////////////////
  bool validate() {
    phoneError = isValidPhone(PhoneNumberController.text);

    phoneIsValid = phoneError.isEmpty;

    return phoneIsValid;
  }

  Future<void> submitPhoneNumber() async {
    emit(Loading());

    try {
      if (validate()) {
        var phonee = codeContrryController.text + PhoneNumberController.text;
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

  void codeSent(String verificationId, int? resendToken) async{
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
     User firebaseUser = FirebaseAuth.instance.currentUser!;
       DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser.uid)
        .get();

    if (userSnapshot.exists) {
      // UserModel existingUser = UserModel.fromJson(userSnapshot.data()!);
      
      

    } else {
      // User does not exist, create a new user data
      UserModel newUser = UserModel(
        name: 'User Name',
        email: 'user@gmail.com',
        gender: '',
        phone: firebaseUser.phoneNumber,
        image: '',
        isVerified: true,
      );

      // Store the new user data in Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid)
          .set(newUser.toJson());
    }
    //  UserModel user = UserModel(
    //   name: 'User Name', 
    //   email: 'user@gmail.com',
    //   gender: '',
    //   phone:firebaseUser.phoneNumber, 
    //   image: '',
    //   isVerified: true, 
    // );
    //   await FirebaseFirestore.instance
    //     .collection('users')
    //     .doc(firebaseUser.uid)
    //     .set(user.toJson());
      emit(PhoneOTPVerified());
    } catch (error) {
      emit(ErrorOccurred(errorMsg: error.toString()));
    }
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  User getLoggedInUser() {
    User firebaseUser = FirebaseAuth.instance.currentUser!;
    return firebaseUser;
  }
}
