import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sophie_messenger_app/base/blocs/social_auth/bloc/cubit/socialauth_cubit.dart';
import 'package:sophie_messenger_app/base/blocs/social_auth/bloc/cubit/socialauth_state.dart';
import 'package:sophie_messenger_app/handlers/icon_handler.dart';
import 'package:sophie_messenger_app/routers/navigator.dart';
import 'package:sophie_messenger_app/routers/routers.dart';
import 'package:sophie_messenger_app/services/login/bloc/login_cubit/login_cubit.dart';
import 'package:sophie_messenger_app/utilities/components/custom_btn.dart';
import 'package:sophie_messenger_app/utilities/components/custom_social_button.dart';
import 'package:sophie_messenger_app/utilities/components/fields/text_input_field.dart';
import 'package:sophie_messenger_app/utilities/theme/media.dart';
import 'package:sophie_messenger_app/utilities/theme/text_styles.dart';
import '../../../utilities/components/snakbar.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

bool isLoading = false;

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => SocialauthCubit(),
        ),
      ],
      child: Scaffold(
        body: Container(
          width: double.infinity,
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
                flex: 5,
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
              Expanded(
                flex: 6,
                child: Container(
                  width: double.infinity,

                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
                  // width: MediaHelper.width,
                  child: BlocConsumer<LoginCubit, LoginState>(
                    listener: (context, LoginState state) {
                      if (state is LoginLoading) {
                        isLoading = true;
                      } else if (state is LoginFailure) {
                        SnackbarComponent.showSnackbar(
                            context, state.errorMessage);
                      } else if (state is LoginSuccess) {
                        CustomNavigator.push(Routes.navigation);
                      }
                    },
                    builder: (context, state) {
                      var bloc = context.read<LoginCubit>();
                      return ModalProgressHUD(
                        inAsyncCall: isLoading,
                        progressIndicator: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              AppTextStyles.maincolor),
                          strokeWidth: 4.0,
                          semanticsLabel: 'Wating',
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 12, top: 10),
                                      child: Text(
                                        "Get Login",
                                        style: TextStyle(
                                            color: Colors.black,
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
                                      keyboardType:
                                          TextInputType.visiblePassword,
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
                                  onTap: () => bloc.click(),
                                  // onTap: () =>
                                  //     CustomNavigator.push(Routes.navigation), //will remove
                                  radius: 18,
                                  textColor: Colors.white,
                                  height: 48,
                                  text: "Get Login",
                                  buttonColor: HexColor('56cfca'),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Forget Password?",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                              ),
                              Text(
                                "OR",
                                style: AppTextStyles.read,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: CustomBtn(
                                  onTap: () {
                                    CustomNavigator.push(Routes.phone);
                                  },
                                  // onTap: () =>
                                  //     CustomNavigator.push(Routes.navigation), //will remove
                                  radius: 18,
                                  textColor: Colors.black,

                                  border: Border.all(color: Colors.grey),
                                  height: 48,
                                  text: "Continue With Phone",
                                  buttonColor: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20),
                                child: BlocConsumer<SocialauthCubit,
                                    SocialauthState>(
                                  listener: (context, state) {},
                                  builder: (context, state) {
                                    var social =
                                        context.read<SocialauthCubit>();

                                    return CustomBtnSocial(

                                      onTap: () {
                                        social.signUpWithFacebook();
                                      },
                                      height: 48,
                                      radius: 18,
                                      buttonColor: Colors.white,
                                      SocialIcon: drawSvgIconColored('facebook',
                                          width: 20, height: 20),
                                      text: 'Continue with Facebook',
                                      textColor: Colors.black,
                                      borderColor: HexColor('#D7D7D7'),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
