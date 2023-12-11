import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophie_messenger_app/core/validator.dart';
import 'package:sophie_messenger_app/services/verification/bloc/phone_state.dart';
import 'package:sophie_messenger_app/services/verification/bloc/verification_code_bloc.dart';

class PhoneCubit extends Cubit<PhoneState> with Validations {
  PhoneCubit(this.verificationCodeBloc) : super(PhoneInitialState());
  static PhoneCubit get(context) => BlocProvider.of(context);
  //////////////////////////////////////////////
  /////////////////////////////////////////////// variables
  ///////////////////////////////////////////////
  TextEditingController codeContrryController = TextEditingController();
  TextEditingController PhoneNumberController = TextEditingController();
  String phoneError = '';
  bool phoneIsValid = true;
  final VerifictionCodeBloc verificationCodeBloc;
  bool validate() {
    phoneError = isValidPhone(PhoneNumberController.text);

    phoneIsValid = phoneError.isEmpty;

    return phoneIsValid;
  }

  Future<void> addPhone() async {

    try {
      if (validate()) {
        print("is validate trur");
        Map<String, dynamic> data = {
          "phone": PhoneNumberController.text,
        };
        emit(PhoneLoading());
        print("Phone Add Sucessfully");
        var phonee = codeContrryController.text + PhoneNumberController.text;
        DocumentReference userRef =  FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid.toString());
        await userRef.update({"phone": phonee}).then((value) {
          print("Field updated successfully");
          //  SendVerificationCode();
          verificationCodeBloc.sendVerificationCode(
              PhoneNumber: PhoneNumberController.text,
              codecontry: codeContrryController.text);
               emit(PhoneSuccess());
          // CustomNavigator.push(Routes.verfication);
        }).catchError((error) {
          emit(PhoneFailure(errorMessege: 'Failed to add phone Try Again!'));
          print("Failed to update field: $error");
        });

       
      } else {
        emit(PhoneFailure(errorMessege: 'Please Enter Valid Phone Number'));
      }
    } on FirebaseAuthException catch (ex) {
      emit(PhoneFailure(errorMessege: 'something went Wrong!'));
      print("something went Wrong $ex");
    }
  }

  // void SendVerificationCode() {
  //   verificationCodeBloc.sendVerificationCode(
  //       PhoneNumber: phonecontroller.text);
  // }
}
