
import 'package:bete_tselot_web/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../utils/image_utils.dart';

typedef OnTap = void Function();

class CommonTextField extends StatelessWidget {
  final TextEditingController? textEditController;
  final String? initialValue;
  final bool? isValidate;
  final bool? readOnly;
  final TextInputType? keyBoardType;
  // final ValidationTypeEnum? validationType;
  final String? regularExpression;
  final int? inputLength;
  final String? hintText;
  final String? labelText;
  final String? validationMessage;
  final String? preFixIconPath;
  final int? maxLine;
  final Widget? sIcon;
  final Widget? pIcon;
  final bool? obscureValue;
  final bool? underLineBorder;
  final bool? showLabel;
  final bool? isDropdown;
  final bool hasError;
  final String? errorMessage;
  // final OnChangeString? onChange;
  final OnTap? onTap;
  final Color? borderColor;
  final bool? contentPadding;
  final bool textCapitalization;

  const CommonTextField({
    super.key,
    this.regularExpression = '',
    this.textEditController,
    this.isValidate = true,
    this.keyBoardType,
    // this.validationType,
    this.inputLength,
    this.readOnly = false,
    this.underLineBorder = false,
    this.showLabel = false,
    this.isDropdown = false,
    this.hintText,
    this.validationMessage,
    this.maxLine,
    this.sIcon,
    this.pIcon,
    this.preFixIconPath,
    // this.onChange,
    this.initialValue = '',
    this.obscureValue,
    this.labelText,
    this.hasError = false,
    this.errorMessage,
    this.onTap,
    this.borderColor,
    this.contentPadding = false,
    this.textCapitalization = false,
  });

  /// PLEASE IMPORT GET X PACKAGE
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: textEditController,
        style: TextStyle(
            color:ColorUtils.black24,
            fontSize: 12.sp,
            fontFamily: FontUtils.poppins),
        keyboardType: keyBoardType ?? TextInputType.text,
        maxLines: maxLine ?? 1,
        onTap: onTap,
        cursorColor: ColorUtils.blued4,
        decoration: InputDecoration(
          // contentPadding: contentPadding == false ? EdgeInsets.zero : null,
          fillColor: ColorUtils.whiteColor,
          filled: true,
          enabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
                color:
                    ColorUtils.blueC6), // Change the bottom border color here
          ),
          focusedBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              width: 2,
                color:
                    ColorUtils.blued4), // Change the bottom border color here
          ),
          errorStyle: TextStyle(
              // color: ColorUtils.red,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              fontFamily: FontUtils.poppins),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
                color:
                    ColorUtils.redColor), // Change the bottom border color here
          ),
          focusedErrorBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(

                color:
                    ColorUtils.redColor), // Change the bottom border color here
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
                color: borderColor ??
                    Colors.transparent), // Change the bottom border color here
          ),
          errorText: hasError ? errorMessage : null,
          suffixIcon: sIcon,
          prefixIcon: pIcon,
          hoverColor: ColorUtils.whiteColor,
          hintText: showLabel! ? '' : hintText.toString().tr,
          hintStyle: TextStyle(
              color: ColorUtils.black77.withOpacity(0.5),
              fontSize: 12.sp,
              fontFamily: FontUtils.poppins),
        ),
      ),
    );
  }
}
