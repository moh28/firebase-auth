
import 'package:dimo/core/colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final void Function()? onTap;
  final String component;
  final Color? color;
  final double? height;
  final double? top;
  final double? bottom;
  final double? start;
  final double? end;
  final double? borderRadius;
  final double? width;

  const AppButton(
      {Key? key,
        this.onTap,
        this.color,
        this.height,
        this.borderRadius,
        this.width,
        required this.component, this.top, this.bottom, this.start, this.end})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(top: top??0,start:start??0,bottom: bottom??0,end: end??0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
            height: height ?? 53,
            width: width ?? double.infinity,
            decoration: BoxDecoration(
              color: color ??primaryColor,
              borderRadius: BorderRadius.circular(borderRadius ?? 6),
            ),
            child: Center(
              child: Text(component,style: const TextStyle(color: Colors.white),),
            )
        ),
      ),

    );
  }
}