import 'package:bete_tselot_web/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  final String title;
  final Color? color;
  final Color? decorationColor;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final double? fontSize;
  final TextAlign? textAlign;
  final double? height;
  final FontStyle? fontStyle;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextDecoration? decoration;
  final double? letterSpacing;
  final double? decorationThickness;
  final List<Shadow>? shadows;

  const CustomText(
    this.title, {
    super.key,
    this.color,
    this.fontWeight,
    this.fontFamily,
    this.fontSize,
    this.textAlign,
    this.height,
    this.fontStyle,
    this.maxLines,
    this.overflow,
    this.decoration = TextDecoration.none,
    this.letterSpacing,
    this.decorationColor,
    this.decorationThickness,
    this.shadows,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxLines,
      style: TextStyle(
        shadows: shadows,
        color: color,
        fontFamily: FontUtils.poppins,
        fontWeight: fontWeight ?? FontWeight.w400,
        fontSize: fontSize ?? 16.sp,
        height: height,
        fontStyle: fontStyle,
        overflow: overflow,
        decoration: decoration,
        decorationColor: decorationColor ?? Colors.black,
        letterSpacing: letterSpacing,
        decorationThickness: decorationThickness ?? 1.8,
      ),
    );
  }
}

CustomText underLineText(
    {required String title,
    double? fontSize,
    FontWeight? fontWeight,
    Color? fontColor}) {
  return CustomText(
    title,
    color: Colors.transparent,
    fontSize: fontSize ?? 14.6.sp,
    shadows: [
      Shadow(color: fontColor ?? Colors.blue, offset: const Offset(0, -2))
    ],
    fontWeight: fontWeight ?? FontWeight.w400,
    decoration: TextDecoration.underline,
    decorationColor: fontColor ?? Colors.blue,
  );
}
