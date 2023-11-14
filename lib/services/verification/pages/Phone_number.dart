import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'package:pinput/pinput.dart';
import 'package:sophie_messenger_app/routers/routers.dart';
import 'package:sophie_messenger_app/services/verification/bloc/phon_cubit.dart';
import 'package:sophie_messenger_app/services/verification/bloc/phone_state.dart';
import 'package:sophie_messenger_app/services/verification/bloc/verification_code_bloc.dart';
import 'package:sophie_messenger_app/services/verification/bloc/verification_state.dart';
import 'package:sophie_messenger_app/utilities/components/custom_btn.dart';
import 'package:sophie_messenger_app/utilities/components/fields/text_input_field.dart';
import 'package:sophie_messenger_app/utilities/theme/text_styles.dart';

import '../../../routers/navigator.dart';

// class Phone extends StatefulWidget {
//   @override
//   State<Phone> createState() => _PhoneState();
// }

// class _PhoneState extends State<Phone> {
//   @override
//   Widget build(BuildContext context) {
//     var phoneNumber;
//     return BlocProvider(
//       create: (context) => PhoneCubit(VerifictionCodeBloc()),
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           leading: InkWell(
//             onTap: () {
//               CustomNavigator.pop(result: Phone());
//             },
//             child: Icon(
//               Icons.arrow_back_ios_new,
//               size: 25,
//             ),
//           ),
//           elevation: 0.0,
//           title: Text(
//             'Verify Phone Number',
//             style: TextStyle(fontWeight: FontWeight.w900),
//           ),
//           centerTitle: true,
//         ),
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
//           child: BlocBuilder<PhoneCubit, PhoneState>(
//             builder: (context, state) {
//               var bloc = context.read<PhoneCubit>();
//               return Column(children: [
//                 Text(
//                   'We have sent you an SMS with a code to number \n+08 905 070 017',
//                   style: TextStyle(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 15,
//                       color: Colors.black54),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 Expanded(
//                   flex: 2,
//                   child: TextInputField(
//                     controller: bloc.phonecontroller,
//                     keyboardType: TextInputType.phone,

//                     hasError: !bloc.phoneIsValid,
//                     errorText: bloc.phoneError,
//                     onChange: (p0) {
//                       if (!bloc.phoneIsValid) {
//                         bloc.phoneIsValid = true;
//                       }
//                     },

//                     // dropdownIconPosition: IconPosition.trailing,
//                     // decoration: InputDecoration(
//                     //   // // suffixIcon: phonecontroller.text.isEmpty
//                     //   //     ? null
//                     //   //     : IconButton(
//                     //   //         onPressed: () {},
//                     //   //         icon: Icon(Icons.cancel,color: Colors.black38,),
//                     //   //       ),
//                     //   enabledBorder: UnderlineInputBorder(
//                     //     borderSide: BorderSide(
//                     //       color: Colors.transparent,
//                     //     ),
//                     //   ),
//                     // labelStyle: TextStyle(
//                     //   color: Colors.grey,
//                     //   fontSize: 22,
//                     //   fontWeight: FontWeight.w500,
//                     // ),
//                     // ),
//                     // initialCountryCode: phoneNumber?.isoCode ?? 'US',
//                     // onChanged: (value) {
//                     //   setState(() {
//                     //     phoneNumber = value;
//                     //   });
//                     // },
//                   ),
//                 ),
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       fixedSize: Size(100, 47),

//                       primary: Colors.amber[600], // change the background color
//                       onPrimary: Colors.white, // change the text color
//                     ),
//                     onPressed: () {
//                       bloc.addPhone();
//                     },
//                     child: Text(
//                       'CONFIRM',
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
//                     ),
//                   ),
//                 ),
//               ]);
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

class Phone extends StatefulWidget {
  @override
  State<Phone> createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
  // TextEditingController phonecontroller = TextEditingController();
  // TextEditingController codecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var phoneNumber;
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
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: () {
              CustomNavigator.pop(result: Phone());
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 25,
              color: Colors.black,
            ),
          ),
          elevation: 0.0,
          title: Text(
            'Verify Phone Number',
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: BlocBuilder<PhoneCubit, PhoneState>(
            builder: (context, state) {
              var bloc = context.read<PhoneCubit>();
              var initialCountryCode;
              return Column(children: [
                Text(
                  'We Will send you an SMS with a code to Your Phone Number!',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.black54),
                ),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  flex: 2,
                  child: IntlPhoneField(
                    controller: bloc.PhoneNumberController,
                    dropdownIconPosition: IconPosition.trailing,
                    decoration: InputDecoration(
                      suffixIcon: bloc.PhoneNumberController.text.isEmpty
                          ? null
                          : IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.cancel,
                                color: Colors.black38,
                              ),
                            ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      labelStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    initialCountryCode: bloc.codeContrryController.text ?? 'en',
                    onChanged: (value) {
                      phoneNumber = value
                          .completeNumber; // Update phoneNumber with the complete number.
                      bloc.codeContrryController.text = value.countryCode; // Up
                      print("phoneNumber://");
                      print(bloc.codeContrryController.text);
                      print(bloc.PhoneNumberController.text);
                      phoneNumber = value;
                    },
                  ),
                ),
                CustomBtn(
                  buttonColor: AppTextStyles.maincolor,
                  height: 55,
                  onTap: () {
                    bloc.addPhone();
                      bloc.verificationCodeBloc.sendVerificationCode(
                          PhoneNumber: bloc
                              .PhoneNumberController.text,
                          codecontry: bloc
                              .codeContrryController.text);
                      //  CustomNavigator.push(Routes.verfication);
                  },
                  text: 'CONFIRM',


                ),
                SizedBox(height: 15,),
                // SizedBox(
                //   width: double.infinity,
                //   child: ElevatedButton(
                //     style: ElevatedButton.styleFrom(
                //       fixedSize: Size(100, 47),

                //       primary: AppTextStyles.maincolor, // change the background color
                //       onPrimary: Colors.white, // change the text color
                //     ),
                //     onPressed: () {
                //       // bloc.addPhone();
                //       // bloc.verificationCodeBloc.sendVerificationCode(
                //       //     PhoneNumber: bloc
                //       //         .PhoneNumberController.text,
                //       //     codecontry: bloc
                //       //         .codeContrryController.text);
                //        CustomNavigator.push(Routes.verfication);
                //     },
                //     child: Text(
                //       'CONFIRM',
                //       style:
                //           TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                //     ),
                //   ),

                // ),
              ]);
            },
          ),
        ),
      ),
    );
  }
}
