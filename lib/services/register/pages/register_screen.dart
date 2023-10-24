import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sophie_messenger_app/utilities/components/custom_btn.dart';
import 'package:sophie_messenger_app/utilities/components/fields/text_input_field.dart';
import 'package:sophie_messenger_app/utilities/theme/media.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _rememberMe = false;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmPasswordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.arrow_back,
                        size: 28,
                        color: Colors.white,
                      ),
                      Text("Get Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 18),)
                    ],
                  ),
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              // width: MediaHelper.width,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text("Signup",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 25),),
                        ),
                        
                        TextInputField(
                          hintText: 'User Name',
                          controller: namecontroller,
                          
                          
                          
                  
                        ),
                        TextInputField(
                          hintText: 'Email Address',
                        ),
                        TextInputField(
                          hintText: 'Password',
                        ),
                        TextInputField(
                          hintText: 'Confirm Password',
                          withBottomPadding: false,
                        ),
                       
                      ],
                    ),
                  ),
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 11),
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
                                    overlayColor: MaterialStatePropertyAll(HexColor('24bbb4')),
                                fillColor:
                                    MaterialStatePropertyAll(HexColor('#24bbb4')),
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
                                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),
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
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                          child: CustomBtn(
                            radius: 18,
                            textColor: Colors.white,
                            height: 48,
                            text: "Signup Now",
                            buttonColor: HexColor('56cfca'),
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
