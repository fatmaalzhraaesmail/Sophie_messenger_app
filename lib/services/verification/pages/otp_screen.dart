import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophie_messenger_app/routers/navigator.dart';
import 'package:sophie_messenger_app/routers/routers.dart';
import 'package:sophie_messenger_app/services/verification/bloc/phone_auth/phone_auth_cubit.dart';
import 'package:sophie_messenger_app/services/verification/bloc/phone_auth/phone_auth_state.dart';
import 'package:sophie_messenger_app/utilities/components/custom_btn.dart';
import 'package:sophie_messenger_app/utilities/components/fields/pin_code_field.dart';
import 'package:sophie_messenger_app/utilities/theme/text_styles.dart';

class OtpScreen extends StatelessWidget {
  final phoneNumber;
  const OtpScreen({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    // var bloc = context.read<VerifictionCodeBloc>();
    return MultiBlocProvider(
      providers: [

        BlocProvider(
          create: (context) => PhoneAuthCubit(),
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    "Verification \nSecurity Code",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 36,
                      letterSpacing: 1,
                      wordSpacing: 1,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: Text(
                    "Just enable the dark mode and be \nking to the nightmare world",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                ),
                BlocConsumer<PhoneAuthCubit, PhoneAuthState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    var bloc = context.read<PhoneAuthCubit>();
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: PinCodeField(
                        codeLength: 6,

                        //

                        onChanged: (value) {
                          print(value);

                          bloc.codeController.text = value;
                          print("code: ${bloc.codeController.text}");
                        },
                      ),
                    );
                  },
                ),
                Spacer(),
                BlocConsumer<PhoneAuthCubit, PhoneAuthState>(
                  listenWhen: (previous, current) {
                    return previous != current;
                  },
                  listener: (context, state) {
                    if (state is Loading) {
                      showProgressIndicator(context);
                    }

                    if (state is PhoneOTPVerified) {
                      CustomNavigator.pop();
                      CustomNavigator.push(replace: true, Routes.continue_setup
                      );
                    }

                    if (state is ErrorOccurred) {
                      //Navigator.pop(context);
                      String errorMsg = (state).errorMsg;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(errorMsg),
                          backgroundColor: Colors.black,
                          duration: Duration(seconds: 3),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    var bloc = context.read<PhoneAuthCubit>();
                    return CustomBtn(
                      text: 'Verify',
                      buttonColor: AppTextStyles.maincolor,
                      onTap: () {
                        showProgressIndicator(context);
                        bloc.submitOTP(bloc.codeController.text);
                      },
                    );
                  },
                ),
                SizedBox(height: 20),
                // BlocConsumer<VerifictionCodeBloc, verificationState>(
                //   listener: (context, state) {
                //     // TODO: implement listener
                //   },
                //   builder: (context, state) {
                //     var bloc = context.read<VerifictionCodeBloc>();
                //     return Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         InkWell(
                //           onTap: () {
                //             bloc.verifyPhoneNumber(
                //                 bloc.verificationId, bloc.smsCode);
                //             // bloc.resendVerificationCode();
                //             // print(bloc.PhoneNumberController.text);
                //             // print( bloc.codeContrryController.text);
                //             // bloc.verificationCodeBloc.sendVerificationCode(
                //             //     PhoneNumber: bloc.PhoneNumberController.text,
                //             //     codecontry: bloc.codeContrryController.text);
                //           },
                //           child: Text(
                //             "Didn't Get Code? Resend",
                //             style: TextStyle(
                //                 color: HexColor('#0977fe'),
                //                 fontWeight: FontWeight.w800,
                //                 fontSize: 16),
                //           ),
                //         ),
                //       ],
                //     );
                //   },
                // ),
                // SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showProgressIndicator(BuildContext context) {
    AlertDialog alertDialog = AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
        ),
      ),
    );

    showDialog(
      barrierColor: Colors.white.withOpacity(0),
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return alertDialog;
      },
    );
  }
}
