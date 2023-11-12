import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sophie_messenger_app/routers/navigator.dart';
import 'package:sophie_messenger_app/routers/routers.dart';
import '../../../../core/validator.dart';
import '../../../../handlers/shared_handler.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> with Validations {
  LoginCubit() : super(LoginInitial());
  //=====================================================
  //===================================================== Variables
  //=====================================================
  TextEditingController emailcontroller = TextEditingController();
  String emailError = '';
  bool emailIsValid = true;
  TextEditingController passwordcontroller = TextEditingController();
  String passwordError = '';
  bool passwordIsValid = true;

  //=====================================================
  //===================================================== Function
  //=====================================================
  bool validate() {
    emailError = isValidEmail(emailcontroller.text);
    passwordError = isValidPassword(passwordcontroller.text);
    emailIsValid = emailError.isEmpty;
    passwordIsValid = passwordError.isEmpty;
    return emailIsValid && passwordIsValid;
  }

  void click() {
    loginUser();
  }

  Future<void> loginUser() async {
    emit(LoginLoading());
    try {
      if (validate()) {
        Map<String, dynamic> data = {
          "email": emailcontroller.text,
          "password": passwordcontroller.text
        };

        UserCredential user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailcontroller.text, password: passwordcontroller.text);
        SharedHandler.instance!.setData(SharedKeys().user, value: data);
        SharedHandler.instance!.setData(SharedKeys().isLogin, value: true);
      
        CustomNavigator.push(Routes.home);
        emit(LoginSuccess());
      }
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'user-not-found') {
        emit(LoginFailure(errorMessage: 'user-not-found'));
      } else if (ex.code == 'wrong-password') {
        
        emit(LoginFailure(errorMessage: 'wrong-password'));
      }
    } catch (e) {
      emit(LoginFailure(errorMessage: 'Something went wrong'));
    }
  }
}
