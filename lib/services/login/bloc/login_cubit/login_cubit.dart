import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
    // emit(LoginLoading());
    var isVerified = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid.toString())
        .get();
    print(isVerified);
    if (isVerified.exists) {
      print("found");
    } else {
      print("cannnnot");
    }
    try {
      // phoneNumber.data()!['phone']
      //  && isVerified.data()!['isVerified']=="true"
      if (validate()) {
        Map<String, dynamic> data = {
          "email": emailcontroller.text,
          "password": passwordcontroller.text
        };

       
        UserCredential user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailcontroller.text, password: passwordcontroller.text);
                emit(LoginLoading());
        SharedHandler.instance!.setData(SharedKeys().user, value: data);
        SharedHandler.instance!.setData(SharedKeys().isLogin, value: true);
        SharedHandler.instance!
            .setData(SharedKeys().userEmail, value: emailcontroller.text);
        // CustomNavigator.push(
        //   Routes.navigation,
        // );
         
        emit(LoginSuccess());
      }
      else{
         emit(LoginFailure(
          errorMessage: 'Please Verify Your account'));
      }
    } 
    on FirebaseAuthException catch (ex) {
      if (ex.code.toUpperCase() == 'USER_NOT_FOUND') {
        emit(LoginFailure(errorMessage: 'No matching account found'));
      } else if (ex.code.toUpperCase() == "WRONG-PASSWORD") {
        emit(LoginFailure(errorMessage: 'wrong-password'));
      }
      else{
        emit(LoginFailure(
         errorMessage: 'Something went wrong With Email Or Password'));
      }
    } catch (e) {
      emit(LoginFailure(errorMessage: 'There was an error please try again'));
    }
    // on FirebaseAuthException catch (ex) {
    //   emit(LoginFailure(
    //       errorMessage: 'Something went wrong With Email Or Password'));
    // } catch (e) {
    //   emit(LoginFailure(errorMessage: 'Something went wrong'));
    // }
  }
}
