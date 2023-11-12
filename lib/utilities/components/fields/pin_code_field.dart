import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:sophie_messenger_app/handlers/localization_handler.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:hexcolor/hexcolor.dart';

class PinCodeField extends StatelessWidget {
  final void Function(String?)? onSave;
  final void Function(String) onChanged;
  final TextEditingController? controller;
  final String? errorText;
  final bool hasError;
  final int? codeLength;
  PinCodeField(
      {this.onSave,
      required this.onChanged,
      this.controller,
      this.errorText,
      this.hasError = false,
      this.codeLength
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: [
          PinCodeTextField(
            // validator: (v) => VerifyCodeValidator.verifyCodeValidator(v!),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            cursorColor: Theme.of(context).primaryColor,
            backgroundColor: Colors.transparent,
            autoDisposeControllers: false,
            autoDismissKeyboard: true,
            enableActiveFill: true,
            controller: controller,
            enablePinAutofill: true,
            keyboardType: TextInputType.number,
            
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[0-9]'))
            ],
            textStyle: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),

            pastedTextStyle: TextStyle(color: Color(0xFF8344AD)),
            pinTheme: PinTheme(
              borderWidth: 2,
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(5),
              fieldHeight: 55,
              fieldWidth: 50,
              fieldOuterPadding: EdgeInsets.symmetric(horizontal: 3),
              activeFillColor: HexColor('#f3f4f6'),
              activeColor: HexColor('#f3f4f6'),
              inactiveColor: HexColor('#f3f4f6'),
              inactiveFillColor: HexColor('#f3f4f6'),
              selectedFillColor: HexColor('#ffffff'),  //
              errorBorderColor: HexColor("#f3f4f6"),
              selectedColor: HexColor('#f3f4f6'),
              disabledColor: Colors.transparent,

            ),
            appContext: context,
            length: codeLength??4,
            onSaved: onSave,
            onChanged: onChanged,
            hintCharacter: "-",
            hintStyle: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
          if (hasError)
            Row(
              textDirection: AppLocale.of(context).locale.languageCode == 'ar'
                  ? TextDirection.rtl
                  : TextDirection.ltr,
              children: [
                const Icon(Icons.error_outline, color: Colors.red, size: 16),
                const SizedBox(width: 4),
                Text(errorText ?? "Error",
                    style: const TextStyle(color: Colors.red)),
              ],
            ),
        ],
      ),
    );
  }
}
