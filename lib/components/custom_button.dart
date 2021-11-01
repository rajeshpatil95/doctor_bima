import 'package:doctor_bima/style/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Key key;
  final double height;
  final double width;
  final bool ignoreCondition;
  final double borderRadius;
  final Function onPressed;
  final String text;
  final TextStyle textStyle;
  final Color buttonColor;
  final double margin;
  final double padding;
  final BoxDecoration decoration;

  CustomButton(
      {this.textStyle = const TextStyle(
          color: AppColors.white, fontWeight: FontWeight.w700, fontSize: 17.0),
      this.key,    
      this.text = '',
      this.width = double.infinity,
      this.height = 50,
      this.onPressed,
      this.borderRadius = 0.0,
      this.ignoreCondition = false,
      this.margin = 0,
      this.padding = 0,
      this.buttonColor,
      this.decoration});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(margin),
      padding: EdgeInsets.all(padding),
      height: height,
      width: width,
      decoration: decoration,
      child: IgnorePointer(
        ignoring: ignoreCondition,
        child: MaterialButton(
          disabledColor: AppColors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              borderRadius,
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: textStyle,
          ),
          color: buttonColor,
        ),
      ),
    );
  }
}
