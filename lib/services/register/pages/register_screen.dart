import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sophie_messenger_app/base/blocs/social_auth/bloc/cubit/socialauth_cubit.dart';
import 'package:sophie_messenger_app/base/blocs/social_auth/bloc/cubit/socialauth_state.dart';
import 'package:sophie_messenger_app/handlers/icon_handler.dart';
import 'package:sophie_messenger_app/routers/navigator.dart';
import 'package:sophie_messenger_app/routers/routers.dart';
import 'package:sophie_messenger_app/services/register/bloc/register_cubit/register_cubit.dart';
import 'package:sophie_messenger_app/utilities/components/custom_btn.dart';
import 'package:sophie_messenger_app/utilities/components/custom_social_button.dart';
import 'package:sophie_messenger_app/utilities/components/fields/text_input_field.dart';
import 'package:sophie_messenger_app/utilities/components/snakbar.dart';
import 'package:sophie_messenger_app/utilities/theme/media.dart';
import 'package:sophie_messenger_app/utilities/theme/text_styles.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
        BlocProvider(
          create: (context) => SocialauthCubit(),
        ),
      ],
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: MediaHelper.height,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
              "assets/images/stefan-stefancik-QXevDflbl8A-unsplash.jpg",
            ),
            fit: BoxFit.cover,
          )),
          child: ModalProgressHUD(
            inAsyncCall: isLoading,
            progressIndicator: CircularProgressIndicator(
              // Customize the color and size of the progress indicator
              valueColor:
                  AlwaysStoppedAnimation<Color>(AppTextStyles.maincolor),
              strokeWidth: 4.0,
              semanticsLabel: 'Wating',
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 5,
                  child: SingleChildScrollView(
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
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
                                onTap: () => CustomNavigator.push(Routes.login),
                                child: Text(
                                  "Get Login",
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
                ),
                Expanded(
                  flex: 8,
                  child: BlocConsumer<RegisterCubit, RegisterState>(
                    listener: (context, state) {
                      if (state is LoginLoading) {
                        isLoading = true;
                      } else if (state is LoginFailure) {
                        SnackbarComponent.showSnackbar(
                            context, state.errorMessage);
                      }
                    },
                    builder: (context, state) {
                      var bloc = context.read<RegisterCubit>();
                      return Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            )),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Text(
                                        "Signup",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w900,
                                            fontSize: 25),
                                      ),
                                    ),
                                    TextInputField(
                                      hintText: 'User Name',
                                      controller: bloc.namecontroller,
                                      keyboardType: TextInputType.name,
                                      hasError: !bloc.nameIsValid,
                                      errorText: bloc.nameError,
                                      onChange: (p0) {
                                        if (!bloc.nameIsValid) {
                                          bloc.nameIsValid = true;
                                        }
                                      },
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
                                    TextInputField(
                                      hintText: 'Confirm Password',
                                      controller:
                                          bloc.confirmPasswordcontroller,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      hasError: !bloc.confirmPasswordIsValid,
                                      errorText: bloc.confirmPasswordError,
                                      onChange: (p0) {
                                        if (!bloc.confirmPasswordIsValid) {
                                          bloc.confirmPasswordIsValid = true;
                                        }
                                      },
                                      withBottomPadding: false,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 11),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Checkbox(
                                      checkColor: HexColor('#FFFFFF'),
                                      focusColor: HexColor('24bbb4'),
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      activeColor: HexColor('FFFFFF'),
                                      hoverColor: HexColor('24bbb4'),
                                      overlayColor: MaterialStatePropertyAll(
                                          HexColor('24bbb4')),
                                      fillColor: MaterialStatePropertyAll(
                                        bloc.agreeCondition == false
                                            ? Colors.white
                                            : HexColor('#24bbb4'),
                                      ),
                                      side: BorderSide(
                                          style: BorderStyle.solid,
                                          color: HexColor('#24bbb4'),
                                          width: 1.3),
                                      value: bloc.agreeCondition,
                                      splashRadius: 5,
                                      tristate: false,
                                      onChanged: (value) {
                                        setState(() {
                                          bloc.agreeCondition = value!;
                                        });
                                        print(value);
                                      },
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        text: 'I need & agree with',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                        children: [
                                          TextSpan(
                                              text: ' Terms & Codition',
                                              style: AppTextStyles.secondary),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: CustomBtn(
                                  onTap: () => bloc.click(),
                                  // onTap: () => CustomNavigator.push(
                                  //     Routes.continue_setup), //will remove
                                  radius: 18,
                                  textColor: Colors.white,
                                  height: 48,
                                  text: "Signup Now",
                                  buttonColor: HexColor('56cfca'),
                                ),
                              ),
                              // SizedBox(
                              //   height: 15,
                              // ),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
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
                )
                //
              ],
            ),
          ),
        ),
      ),
    );
  }
}
