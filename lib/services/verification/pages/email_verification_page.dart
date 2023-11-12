import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sophie_messenger_app/services/verification/bloc/email_verification_cubit.dart';
import 'package:sophie_messenger_app/services/verification/bloc/verification_state.dart';
import 'package:sophie_messenger_app/utilities/components/custom_btn.dart';
import 'package:sophie_messenger_app/utilities/theme/text_styles.dart';

import '../../../utilities/components/fields/pin_code_field.dart';

class EmailVerificationPage extends StatelessWidget {
  const EmailVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    // var bloc = context.read<VerifictionCodeBloc>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => EmailVerificationCubit(),
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
                BlocConsumer<EmailVerificationCubit, verificationState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    var bloc = context.read<EmailVerificationCubit>();
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: PinCodeField(
                        codeLength: 4,
                        // controller: bloc.codeController,
                        onChanged: (value) {
                          bloc.codeController.text = value;
                          print("code: ${bloc.codeController.text}");
                        },
                      ),
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        CircularProgressIndicator(
                          color: HexColor('#0977fe'),
                          backgroundColor: Colors.grey[300],
                          strokeWidth: 3,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Wating Code",
                          style: AppTextStyles.w600,
                        )
                      ],
                    ),
                  ],
                ),
                Spacer(),
                BlocConsumer<EmailVerificationCubit, verificationState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    var bloc = context.read<EmailVerificationCubit>();
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          // onTap: () {
                          //   bloc.verifyPhoneNumber(bloc.verificationId, bloc.smsCode);
                          // },
                          child: Text(
                            "Didn't Get Code? Resend",
                            style: TextStyle(
                                color: HexColor('#0977fe'),
                                fontWeight: FontWeight.w800,
                                fontSize: 16),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                BlocBuilder<EmailVerificationCubit, verificationState>(
                  builder: (context, state) {
                    var bloc = context.read<EmailVerificationCubit>();
                    return CustomBtn(
                      text: 'Verify',
                      onTap: () {
                        bloc.verifyEmail();
                      },
                    );
                  },
                ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => EmailVerificationCubit(),
//       child: Scaffold(
//         body: BlocBuilder<EmailVerificationCubit, verificationState>(
//           builder: (context, state) {
//             var bloc = context.read<EmailVerificationCubit>();
//             return SafeArea(
//                 child: Container(
//                   width: MediaHelper.width,
//                   height: MediaHelper.height,
//                   child: Column(
//                               children: [
//                   Expanded(
//                       child: SingleChildScrollView(
//                     child: Container(
//                       width: MediaHelper.width,
//                       child: Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.symmetric(
//                                 vertical: 20, horizontal: 20),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "Verification \nSecurity Code",
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.w800,
//                                     fontSize: 36,
//                                     letterSpacing: 1,
//                                     wordSpacing: 1,
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(vertical: 25),
//                                   child: Text(
//                                     "Just enable the dark mode and be \nking to the nightmare world",
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 15,
//                                     ),
//                                   ),
//                                 ),
//                                 Container(
//                                   width: MediaHelper.width,
//                                   child: Row(
//                                     children: [
//                                       PinCodeField(
//                                         onChanged: (value) {
//                                           bloc.codeController.text = value;
//                                           print(
//                                               "code: ${bloc.codeController.text}");
//                                         },
//                                         errorText: bloc.codeError,
//                                         controller: bloc.codeController,
//                                         codeLength: 4,
//                                         // hasError: bloc.codeError,
//                                       )
//                                     ],
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ))
//                               ],
//                             ),
//                 ));
//           },
//         ),
//       ),
//     );
//   }
// }
