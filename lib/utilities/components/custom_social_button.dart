
import 'package:flutter/material.dart';
import 'package:sophie_messenger_app/base/blocs/theme_bloc.dart';
import 'package:sophie_messenger_app/utilities/theme/media.dart';
import 'package:sophie_messenger_app/utilities/theme/text_styles.dart';

class CustomBtnSocial extends StatelessWidget {
  const CustomBtnSocial({
    super.key,
    this.height,
    this.width,
    this.radius,
    this.text,
    this.buttonColor,
    this.textColor,
    this.onTap,
    this.borderColor,
    this.SocialIcon
  });

  final double? height;
  final double? width;
  final double? radius;
  final String? text;
  final Widget? SocialIcon;
  final Color? buttonColor;
  final Color? textColor;
  final Color? borderColor;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        
        width: width ?? MediaHelper.width,
        height: height ?? 56,
        decoration: BoxDecoration(
          color: buttonColor ?? themeBloc.theme.valueOrNull!.primary,
          borderRadius: BorderRadius.circular(radius ?? 8),
          border: Border.all(color:borderColor ??Colors.black,width: 2, )
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialIcon??Text('sss',style: TextStyle(color: Colors.black),),
              SizedBox(width: 8,),
              Text(
                text ?? "Clicke here",
            style: AppTextStyles.w700.copyWith(fontSize: 17, color: textColor ?? Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}