import 'package:flutter/material.dart';

import '../colors.dart';

class AppInput extends StatelessWidget {
  final void Function(String?)? onChanged;
  final void Function(String?)? onSubmitted;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validate;
  final Widget? prefixIcon;
  final int?maxLines;
  final Widget? suffixIcon;
  final double? start;
  final double? end;
  final double? top;
  final double? bottom;
  final TextInputType? inputType;
  final String? label;
  final String? hint;
  final bool? secureText;
  final bool? isEnabled;
  final bool? autofocus;
  final Color? color;
  final Color? iconColor;
  final TextEditingController? controller;
  final Color? borderColor;
  final double? contentLeft;
  final double? contentRight;
  final double? contentTop;
  final double? contentBottom;
  final Color? enabledBorderColor;
  final double?border;
  const AppInput(
      {Key? key,
        this.onChanged,
        this.validate,
        this.prefixIcon,
        this.suffixIcon,
        this.inputType,
        this.label,
        this.hint,
        this.secureText,
        this.onSubmitted,
        this.isEnabled = true,
        this.controller,
        this.color,
        this.onSaved,
        this.autofocus,
        this.iconColor,
        this.borderColor, this.contentLeft, this.contentRight, this.contentTop, this.contentBottom, this.start, this.end, this.top, this.bottom,  this.enabledBorderColor, this.maxLines, this.border})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          start: start ?? 0, end: end ?? 0,top: top??0,bottom: bottom??0),
      child: Container(
        width: double.infinity,
        child: TextFormField(
          maxLines:maxLines??1 ,
          enabled: isEnabled ?? true,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          onFieldSubmitted: onSubmitted,
          style: const TextStyle(color: primaryColor, fontSize: 20),
          obscureText: secureText ?? false,
          cursorColor: primaryColor,
          keyboardType: inputType ?? TextInputType.text,
          validator: validate,
          onSaved: onSaved,
          autofocus: autofocus ?? false,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(border??15),
              borderSide:  BorderSide(
                color: enabledBorderColor??authBorderColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular( border??15),
              borderSide: const BorderSide(color: primaryColor),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular( border??15),
              borderSide: const BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular( border??15),
              borderSide: const BorderSide(color: Colors.red),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular( 15),
              borderSide:  const BorderSide(color:  authBorderColor),
            ),
            contentPadding:  EdgeInsets.only(
                right: contentRight??20, top:contentTop?? 20.0, bottom:contentBottom?? 20.0, left:contentLeft?? 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(border??15),
              borderSide: const BorderSide(color: primaryColor),
            ),
            filled: true,
            fillColor: color ?? const Color(0xFFFFFFFF),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            suffixIconConstraints:
            const BoxConstraints(maxHeight: 35, maxWidth: 45),
            labelText: label,
            labelStyle: const TextStyle(
              fontSize: 15,
              color: Color(0xffAFAFAF),
            ),
            hintStyle: const TextStyle(
                fontSize: 15, color: Color(0xffAFAFAF) ),
            hintText: hint,
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
