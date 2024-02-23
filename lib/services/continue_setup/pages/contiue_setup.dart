import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophie_messenger_app/services/continue_setup/bloc/cubit.dart';
import 'package:sophie_messenger_app/services/continue_setup/bloc/state.dart';
import 'package:sophie_messenger_app/services/continue_setup/widget/gender_widget.dart';
import 'package:sophie_messenger_app/utilities/components/custom_btn.dart';
import 'package:sophie_messenger_app/utilities/theme/text_styles.dart';
class ContinueSetup extends StatefulWidget {
  const ContinueSetup({super.key});

  @override
  State<ContinueSetup> createState() => _ContinueSetupState();
}

class _ContinueSetupState extends State<ContinueSetup> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ContinueSetupCubit(),
        ),

      ],
      child: Scaffold(
        body: SafeArea(
            child: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi Fatma, \nChoose Gender",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                        fontSize: 36,
                        letterSpacing: 1,
                        wordSpacing: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: Text(
                        "Just help us to know most of the overall \nexperience by using our apps",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                           color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    BlocBuilder<ContinueSetupCubit, ContinueSetupState>(
                      builder: (context, state) {
                        return Container(
                          height: 150,
                          child: Row(
                            children: [
                              CardGender(0, "maleee", "Male"),
                              SizedBox(width: 10),
                              CardGender(1, "female", "Female"),
                            ],
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            )),
            BlocBuilder<ContinueSetupCubit, ContinueSetupState>(
              builder: (context, state) {
                var bloc = context.read<ContinueSetupCubit>();
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: CustomBtn(
                    text: 'Continue Setup',

                    buttonColor: AppTextStyles.maincolor,
                    height: 48,
                    onTap: () async {
                     bloc.chooseGender(index: bloc.selectedIndex);
                      print(bloc.selectedIndex);
                      //  CustomNavigator.push(Routes.phone);   //will remove

                      // await bloc.emailverification.sendVerificationCodeee();
                    },
                    radius: 18,
                  ),
                );
              },
            )
          ],
        )),
      ),
    );
  }
}
