import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sophie_messenger_app/routers/navigator.dart';
import 'package:sophie_messenger_app/routers/routers.dart';
import 'package:sophie_messenger_app/services/login/bloc/login_cubit/login_cubit.dart';
import 'package:sophie_messenger_app/utilities/components/custom_btn.dart';
import 'package:sophie_messenger_app/utilities/components/fields/text_input_field.dart';
import 'package:sophie_messenger_app/utilities/theme/media.dart';
import '../../../utilities/components/snakbar.dart';
class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        body: Container(
          width: MediaHelper.width,
          height: MediaHelper.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
              "assets/images/stefan-stefancik-QXevDflbl8A-unsplash.jpg",
            ),
            fit: BoxFit.cover,
          )),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => CustomNavigator.pop(),
                          child: Icon(
                            Icons.arrow_back,
                            size: 28,
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                            onTap: () => CustomNavigator.push(Routes.register),
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaHelper.width,
                
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                // width: MediaHelper.width,
                child: BlocConsumer<LoginCubit, LoginState>(
                  listener: (context,LoginState state) {
                    if (state is LoginFailure) {
                      SnackbarComponent.showSnackbar(
                          context, state.errorMessage);
                    }
                  },
                  builder: (context, state) {
                    var bloc = context.read<LoginCubit>();
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 12, top: 10),
                                child: Text(
                                  "Get Login",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 28),
                                ),
                              ),
                              TextInputField(
                                controller: bloc.emailcontroller,
                                keyboardType: TextInputType.emailAddress,
                                hintText: 'Email Address',
                                hasError: !bloc.emailIsValid,
                                errorText: bloc.emailError,
                                onChange: (p0) {
                                  if (!bloc.emailIsValid) {
                                    bloc.emailIsValid = true;
                                  }
                                },
                              ),
                              TextInputField(
                                hintText: 'Password',
                                controller: bloc.passwordcontroller,
                                hasError: !bloc.passwordIsValid,
                                errorText: bloc.passwordError,
                                onChange: (p0) {
                                  if (!bloc.passwordIsValid) {
                                    bloc.passwordIsValid = true;
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: CustomBtn(
                            // onTap: () => bloc.click(),
                           onTap:()=>  CustomNavigator.push(Routes.navigation),
                            radius: 18,
                            textColor: Colors.white,
                            height: 48,
                            text: "Get Login",
                            buttonColor: HexColor('56cfca'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Forget Password?",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
