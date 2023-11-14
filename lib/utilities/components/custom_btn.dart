import 'package:flutter/material.dart';
import 'package:sophie_messenger_app/utilities/theme/colors/colors.dart';
import 'package:sophie_messenger_app/utilities/theme/media.dart';
import 'package:sophie_messenger_app/utilities/theme/text_styles.dart';

import '../../base/blocs/theme_bloc.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    super.key,
    this.height,
    this.width,
    this.radius,
    this.text,
    this.buttonColor,
    this.textColor,
    this.onTap,
  });

  final double? height;
  final double? width;
  final double? radius;
  final String? text;
  final Color? buttonColor;
  final Color? textColor;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ??double.infinity,

        height: height ?? 56,
        decoration: BoxDecoration(
          color: buttonColor ?? themeBloc.theme.valueOrNull!.primary,
          borderRadius: BorderRadius.circular(radius ?? 8),
        ),
        child: Center(
          child: Text(
            text ?? "Clicke here",
            style: AppTextStyles.w700.copyWith(fontSize: 17, color: textColor ?? Colors.white),
          ),
        ),
      ),
    );
  }
}
