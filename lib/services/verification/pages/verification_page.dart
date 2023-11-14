import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophie_messenger_app/routers/navigator.dart';
import 'package:sophie_messenger_app/routers/routers.dart';
import 'package:sophie_messenger_app/services/verification/bloc/phon_cubit.dart';
import 'package:sophie_messenger_app/services/verification/bloc/verification_code_bloc.dart';
import 'package:sophie_messenger_app/services/verification/bloc/verification_state.dart';
import 'package:sophie_messenger_app/utilities/components/custom_btn.dart';
import 'package:sophie_messenger_app/utilities/components/fields/pin_code_field.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sophie_messenger_app/utilities/theme/text_styles.dart';


class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    // var bloc = context.read<VerifictionCodeBloc>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => VerifictionCodeBloc(),
        ),
        BlocProvider(
          create: (context) => PhoneCubit(VerifictionCodeBloc()),
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
                BlocConsumer<VerifictionCodeBloc, verificationState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    var bloc = context.read<VerifictionCodeBloc>();
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: PinCodeField(
                        codeLength: 6,
                        
                        //
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
                BlocBuilder<VerifictionCodeBloc, verificationState>(
                  builder: (context, state) {
                    var bloc = context.read<VerifictionCodeBloc>();
                    return CustomBtn(
                      text: 'Verify',
                      buttonColor: AppTextStyles.maincolor,
                      onTap: () {
                        CustomNavigator.push(Routes.login); //will remove
                        // bloc.verifyPhoneNumber(
                        //     bloc.verificationId, bloc.codeController.text);
                      },
                    );
                  },
                ),
                SizedBox(height: 20),
                BlocConsumer<VerifictionCodeBloc, verificationState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    var bloc = context.read<VerifictionCodeBloc>();
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            bloc.verifyPhoneNumber(bloc.verificationId, bloc.smsCode);
                          },
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
//     return Scaffold(
//       body: SafeArea(
//           child: Column(
//         children: [
//           Expanded(
//               child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Verification \nSecurity Code",
//                         style: TextStyle(
//                           fontWeight: FontWeight.w800,
//                           fontSize: 36,
//                           letterSpacing: 1,
//                           wordSpacing: 1,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 25),
//                         child: Text(
//                           "Just enable the dark mode and be \nking to the nightmare world",
//                           style: TextStyle(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 15,
//                           ),
//                         ),
//                       ),
//                       Container(
//                         width: MediaHelper.width,
//                         child: Row(
//                           children: [
//                             PinCodeField(
//                               onChanged: (p0) {},
//                               errorText: 'nbbb',
//                               controller: ,
//                             )
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ))
//         ],
//       )),
//     );
//   }
// }
