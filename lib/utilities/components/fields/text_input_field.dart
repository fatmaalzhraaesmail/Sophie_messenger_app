// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../handlers/icon_handler.dart';
import '../../theme/text_styles.dart';

class TextInputField extends StatefulWidget {
  const TextInputField({super.key, this.onChange, this.controller,this.inputFormatters = const [], this.errorText, this.hintText, this.initialValue, this.labelText, this.withBottomPadding = true, this.hasError = false, this.keyboardType, this.suffixIcon, this.maxLines = 0, this.maxLength});
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final bool hasError;
  final String? initialValue;
  final TextEditingController? controller;
  final Function(String)? onChange;
  final bool withBottomPadding;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final int maxLines;
  final int? maxLength;
  final List<TextInputFormatter> inputFormatters;
  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  bool showText = true;
  String? value;
  _mapSuffixIcon() {
    if (widget.keyboardType == null) {
      return null;
    }else if(widget.keyboardType == TextInputType.emailAddress){
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        child: drawSvgIcon("email_outlined",iconColor: Colors.grey),
      );
    } 
    else if (widget.keyboardType == TextInputType.phone) {
      
      return Padding(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Container(
          width: 32,
          height: 32,
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey,
            
          ),
          child: Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
              image: DecorationImage(
                image: AssetImage("assets/images/saudi.png"),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      );
    } else if (widget.keyboardType == TextInputType.visiblePassword) {
      return GestureDetector(
        child: Padding(padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          child: drawSvgIcon(showText ? "eye_hide" : "eye_show",iconColor: Colors.grey),
        ),
        onTap: () {
          setState(() {
            showText = !showText;
          });
        },
      );
    } else {
      return null;
    }
  }
  @override
  void initState() { 
    super.initState();
    value = widget.initialValue;
    showText = widget.keyboardType != TextInputType.visiblePassword;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null)
          Text(
            widget.labelText ?? "",
            style: AppTextStyles.w700.copyWith(fontSize: 18),
          ),
        if (widget.labelText != null) const SizedBox(height: 8),
        SizedBox(
          height: 52,
          child: TextFormField(
            
            controller: widget.controller,
            initialValue: widget.controller != null ? null : widget.initialValue,
            onChanged: (val){
              setState(() {
                if(val.isNotEmpty)this.value = val;
                else this.value = null;
              });
              widget.onChange?.call(val);
            },
            keyboardType: widget.keyboardType ?? TextInputType.text,
            style: AppTextStyles.w300,
            obscureText: !showText,
            inputFormatters: widget.inputFormatters,
            decoration: InputDecoration(
              
              hintText: widget.hintText,
              hintStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.grey),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16,vertical: 24),
              suffixIcon: widget.suffixIcon ?? _mapSuffixIcon(),
              enabledBorder: _mapBorder(borderColor: value == null ? Colors.transparent : Colors.transparent),
              focusedBorder: _mapBorder(borderColor: Theme.of(context).colorScheme.primary),
              
              errorBorder: _mapBorder(borderColor: Colors.red),
              fillColor: HexColor('#ebedf4'),
              filled: true,
            ),
          ),
        ),
        if (widget.hasError) const SizedBox(height: 8),
        if (widget.hasError)
          Row(
            children: [
              const Icon(Icons.error_outline, color: Colors.red, size: 16),
              const SizedBox(width: 4),
              Text(widget.errorText ?? "Error", style: const TextStyle(color: Colors.red)),
            ],
          ),
        if (widget.withBottomPadding) const SizedBox(height: 8),
      ],
    );
  }

  OutlineInputBorder _mapBorder({required Color borderColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(9),
      borderSide: BorderSide(color: borderColor),
    );
  }
}
