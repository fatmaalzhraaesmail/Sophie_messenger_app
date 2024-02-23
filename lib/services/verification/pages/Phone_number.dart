// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
// import 'package:sophie_messenger_app/routers/routers.dart';
// import 'package:sophie_messenger_app/services/verification/bloc/phon_cubit.dart';
// import 'package:sophie_messenger_app/services/verification/bloc/phone_state.dart';
// import 'package:sophie_messenger_app/services/verification/bloc/verification_code_bloc.dart';
// import 'package:sophie_messenger_app/utilities/components/custom_btn.dart';
// import 'package:sophie_messenger_app/utilities/components/snakbar.dart';
// import 'package:sophie_messenger_app/utilities/theme/text_styles.dart';

// import '../../../routers/navigator.dart';

// class Phone extends StatefulWidget {
//   @override
//   State<Phone> createState() => _PhoneState();
// }

// class _PhoneState extends State<Phone> {
//   // TextEditingController phonecontroller = TextEditingController();
//   // TextEditingController codecontroller = TextEditingController();
//   bool isLoading = false;
//   var phoneNumber;

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           create: (context) => VerifictionCodeBloc(),
//         ),
//         BlocProvider(
//           create: (context) => PhoneCubit(VerifictionCodeBloc()),
//         ),
//       ],
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
//               color: Colors.black,
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
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//           child: BlocConsumer<PhoneCubit, PhoneState>(
//             listener: (context, state) {
//               if (state is PhoneLoading) {
//                 isLoading = true;
//               } else if (state is PhoneFailure) {
//                 SnackbarComponent.showSnackbar(context, state.errorMessege);
//               } else {
//                 CustomNavigator.push(Routes.verfication);
//               }
//             },
//             builder: (context, state) {
//               var bloc = context.read<PhoneCubit>();
//               var initialCountryCode;
//               return ModalProgressHUD(
//                 color: Colors.transparent,
//                 inAsyncCall: isLoading,
//                 progressIndicator: CircularProgressIndicator(
//                   // Customize the color and size of the progress indicator
//                   valueColor:
//                       AlwaysStoppedAnimation<Color>(AppTextStyles.maincolor),
//                   strokeWidth: 4.0,
//                   semanticsLabel: 'Wating',
//                 ),
//                 child: Column(children: [
//                   Text(
//                     'We Will send you an SMS with a code to Your Phone Number!',
//                     style: TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontSize: 15,
//                         color: Colors.black54),
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   Expanded(
//                     flex: 2,
//                     child: IntlPhoneField(
//                       controller: bloc.PhoneNumberController,
//                       dropdownIconPosition: IconPosition.trailing,
//                       decoration: InputDecoration(
//                         suffixIcon: bloc.PhoneNumberController.text.isEmpty
//                             ? null
//                             : IconButton(
//                                 onPressed: () {},
//                                 icon: Icon(
//                                   Icons.cancel,
//                                   color: Colors.black38,
//                                 ),
//                               ),
//                         border: UnderlineInputBorder(
//                           borderSide: BorderSide(
//                             color: AppTextStyles.maincolor,
//                           ),
//                         ),
//                         enabledBorder: UnderlineInputBorder(
//                           borderSide: BorderSide(
//                             color: AppTextStyles.maincolor,
//                           ),
//                         ),
//                         focusColor: AppTextStyles.maincolor,
//                         focusedBorder: UnderlineInputBorder(
//                           borderSide: BorderSide(
//                             color: AppTextStyles.maincolor,
//                           ),
//                         ),
//                         labelStyle: TextStyle(
//                           color: Colors.grey,
//                           fontSize: 22,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       initialCountryCode:
//                           bloc.codeContrryController.text ?? 'en',
//                       onChanged: (value) {
//                         phoneNumber = value
//                             .completeNumber; // Update phoneNumber with the complete number.
//                         bloc.codeContrryController.text =
//                             value.countryCode; // Up
//                         print("phoneNumber://");
//                         print(bloc.codeContrryController.text);
//                         print(bloc.PhoneNumberController.text);
//                         phoneNumber = value;
//                       },
//                     ),
//                   ),
//                   CustomBtn(
//                     buttonColor: AppTextStyles.maincolor,
//                     height: 55,
//                     onTap: () {
//                       bloc.addPhone();
//                        bloc.verificationCodeBloc.sendVerificationCode(
//                           PhoneNumber: bloc
//                               .PhoneNumberController.text,
//                           codecontry: bloc
//                               .codeContrryController.text);
//                       //  CustomNavigator.push(Routes.verfication);
//                       //  print(bloc.codeContrryController.text);
//                       //   print(bloc.PhoneNumberController.text);
//                       // bloc.verificationCodeBloc.sendVerificationCode(
//                       //     PhoneNumber: bloc
//                       //         .PhoneNumberController.text,
//                       //     codecontry: bloc
//                       //         .codeContrryController.text);
//                       // //  CustomNavigator.push(Routes.verfication);

//                     },
//                     text: 'CONFIRM',
//                   ),
//                   SizedBox(
//                     height: 15,
//                   ),
//                 ]),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sophie_messenger_app/routers/routers.dart';
import 'package:sophie_messenger_app/services/verification/bloc/phone_auth/phone_auth_cubit.dart';
import 'package:sophie_messenger_app/services/verification/bloc/phone_auth/phone_auth_state.dart';
import 'package:sophie_messenger_app/utilities/components/custom_btn.dart';
import 'package:sophie_messenger_app/utilities/theme/text_styles.dart';

import '../../../routers/navigator.dart';

class Phone extends StatefulWidget {
  @override
  State<Phone> createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
  // TextEditingController phonecontroller = TextEditingController();
  // TextEditingController codecontroller = TextEditingController();
  bool isLoading = false;
  late String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PhoneAuthCubit(),
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
          child: BlocConsumer<PhoneAuthCubit, PhoneAuthState>(
            listenWhen: (previous, current) {
              return previous != current;
            },
            listener: (context, state) {
              if (state is Loading) {
                isLoading = true;
              }

              if (state is PhoneNumberSubmited) {
                Navigator.pop(context);
                CustomNavigator.push(
                    replace: true, Routes.otp, arguments: phoneNumber);
             
              }

              if (state is ErrorOccurred) {
                Navigator.pop(context);
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
              var initialCountryCode;
              return ModalProgressHUD(
                color: Colors.transparent,
                inAsyncCall: isLoading,
                progressIndicator: CircularProgressIndicator(
                  // Customize the color and size of the progress indicator
                  valueColor:
                      AlwaysStoppedAnimation<Color>(AppTextStyles.maincolor),
                  strokeWidth: 4.0,
                  semanticsLabel: 'Wating',
                ),
                child: Column(children: [
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
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: AppTextStyles.maincolor,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: AppTextStyles.maincolor,
                          ),
                        ),
                        focusColor: AppTextStyles.maincolor,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: AppTextStyles.maincolor,
                          ),
                        ),
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      initialCountryCode:
                          bloc.codeContrryController.text ?? 'en',
                      onChanged: (value) {
                        // phoneNumber = value
                        //     .completeNumber; // Update phoneNumber with the complete number.
                        bloc.codeContrryController.text =
                            value.countryCode; // Up
                        print("phoneNumber://");
                        print(bloc.codeContrryController.text);
                        print(bloc.PhoneNumberController.text);
                        phoneNumber = bloc.codeContrryController.text+bloc.PhoneNumberController.text;
                      },
                    ),
                  ),
                  CustomBtn(
                    buttonColor: AppTextStyles.maincolor,
                    height: 55,
                    onTap: () {
                      bloc.submitPhoneNumber();
                    },
                    text: 'CONFIRM',
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ]),
              );
            },
          ),
        ),
      ),
    );
  }
}
