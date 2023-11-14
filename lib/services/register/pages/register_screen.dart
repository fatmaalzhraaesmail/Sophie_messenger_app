import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sophie_messenger_app/routers/navigator.dart';
import 'package:sophie_messenger_app/routers/routers.dart';
import 'package:sophie_messenger_app/services/register/bloc/register_cubit/register_cubit.dart';
import 'package:sophie_messenger_app/utilities/components/custom_btn.dart';
import 'package:sophie_messenger_app/utilities/components/fields/text_input_field.dart';
import 'package:sophie_messenger_app/utilities/theme/media.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
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
          child: Column(
            children: [
              Expanded(
                flex: 1,
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
                child: Container(
                  width: double.infinity,

                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
                  // width: MediaHelper.width,
                  child: BlocConsumer<RegisterCubit, RegisterState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      var bloc = context.read<RegisterCubit>();
                      return SingleChildScrollView(
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
                                    keyboardType: TextInputType.visiblePassword,
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
                                    controller: bloc.confirmPasswordcontroller,
                                    keyboardType: TextInputType.visiblePassword,
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
                                       _rememberMe==false?Colors.white:HexColor('#24bbb4'),
                                       ),
                                    side: BorderSide(
                                        style: BorderStyle.solid,
                                        color: HexColor('#24bbb4'),
                                        width: 1.3),
                                    value: _rememberMe,
                                    splashRadius: 5,
                                    tristate: false,
                                    onChanged: (value) {
                                      setState(() {
                                        _rememberMe = value!;
                                      });
                                    },
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      text: 'I need & agree with',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                      children: [
                                        TextSpan(
                                          text: ' Terms & Codition',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: HexColor('#5496ff'),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
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
                          ],
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
