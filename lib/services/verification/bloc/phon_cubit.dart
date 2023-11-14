import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophie_messenger_app/core/validator.dart';
import 'package:sophie_messenger_app/routers/navigator.dart';
import 'package:sophie_messenger_app/routers/routers.dart';
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
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final VerifictionCodeBloc verificationCodeBloc;
  bool validate() {
    phoneError = isValidPhone(PhoneNumberController.text);

    phoneIsValid = phoneError.isEmpty;

    return phoneIsValid;
  }

  Future<void> addPhone() async {
    emit(PhoneSuccess());

    try {
      Map<String, dynamic> data = {
        "phone": PhoneNumberController.text,
      };
      print("Phone Add Sucessfully");
      var phonee = codeContrryController.text + PhoneNumberController.text;
      DocumentReference userRef = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid.toString());
      await userRef.update({"phone": phonee}).then((value) {
        print("Field updated successfully");
        //  SendVerificationCode();

       CustomNavigator.push(Routes.verfication);
      }).catchError((error) {
        print("failled to add phone");
        print("Failed to update field: $error");
      });

      emit(PhoneSuccess());
    } on FirebaseAuthException catch (ex) {
             CustomNavigator.push(Routes.verfication);

      print("something went Wrong");
    }
  }

  // void SendVerificationCode() {
  //   verificationCodeBloc.sendVerificationCode(
  //       PhoneNumber: phonecontroller.text);
  // }
}
