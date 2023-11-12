import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sophie_messenger_app/base/models/user_model.dart';
import 'package:sophie_messenger_app/core/validator.dart';
import 'package:sophie_messenger_app/routers/navigator.dart';
import 'package:sophie_messenger_app/routers/routers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> with Validations {
  RegisterCubit() : super(RegisterInitial());

  //=====================================================
  //===================================================== Variables
  //=====================================================

  TextEditingController namecontroller = TextEditingController();
  String nameError = '';
  bool nameIsValid = true;

  TextEditingController emailcontroller = TextEditingController();
  String emailError = '';
  bool emailIsValid = true;

  TextEditingController passwordcontroller = TextEditingController();
  String passwordError = '';
  bool passwordIsValid = true;

  TextEditingController confirmPasswordcontroller = TextEditingController();
  String confirmPasswordError = '';
  bool confirmPasswordIsValid = true;

  UserModel? usermodel;
//=====================================================
  //===================================================== Function
  //=====================================================

  bool validate() {
    nameError = isValidName(namecontroller.text);
    emailError = isValidEmail(emailcontroller.text);
    passwordError = isValidPassword(passwordcontroller.text);
    confirmPasswordError = isValidConfirmPassword(
        passwordcontroller.text, confirmPasswordcontroller.text);
    nameIsValid = nameError.isEmpty;
    emailIsValid = emailError.isEmpty;
    passwordIsValid = passwordError.isEmpty;
    confirmPasswordIsValid = confirmPasswordError.isEmpty;
    return nameIsValid &&
        emailIsValid &&
        passwordIsValid &&
        confirmPasswordIsValid;
  }

  // _update(AppEvents event, Emitter emit) async => emit(Start());
  void click() {
    userRegister();
  }

  Future<void> userRegister() async {
    emit(LoginLoading());
    try {
      if (validate()) {
        Map<String, dynamic> data = {
          "name": namecontroller.text,
          "email": emailcontroller.text,
          "password": passwordcontroller.text,
        };

        UserCredential user = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailcontroller.text, password: passwordcontroller.text);

        usermodel = UserModel(
          name: namecontroller.text,
          email: emailcontroller.text,
        );
        storeDatabaseFirestore(user.user!.uid.toString()).then((value) {
         

          CustomNavigator.push(Routes.continue_setup);
        });

        emit(LoginSuccess());
      }
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'weak-password') {
        emit(LoginFailure(errorMessage: 'weak-password'));
      } else if (ex.code == 'email-aleardy-in-use') {
        emit(LoginFailure(errorMessage: 'email-aleardy-in-use'));
      }
    } catch (e) {
      emit(LoginFailure(errorMessage: 'there was an error please try again'));
    }
  }

  Future storeDatabaseFirestore(String id) async {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .set(usermodel!.toJson());
  }
}
