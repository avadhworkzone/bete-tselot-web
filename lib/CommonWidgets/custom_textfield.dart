// import 'package:bete_tselot/utils/color_utils.dart';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
//
// import '../utils/image_utils.dart';
//
// typedef OnTap = void Function();
//
// class CommonTextField extends StatelessWidget {
//   final TextEditingController? textEditController;
//   final String? initialValue;
//   final bool? isValidate;
//   final bool? readOnly;
//   final TextInputType? keyBoardType;
//   // final ValidationTypeEnum? validationType;
//   final String? regularExpression;
//   final int? inputLength;
//   final String? hintText;
//   final String? labelText;
//   final String? validationMessage;
//   final String? preFixIconPath;
//   final int? maxLine;
//   final Widget? sIcon;
//   final Widget? pIcon;
//   final bool? obscureValue;
//   final bool? underLineBorder;
//   final bool? showLabel;
//   final bool? isDropdown;
//   final bool hasError;
//   final String? errorMessage;
//   // final OnChangeString? onChange;
//   final OnTap? onTap;
//   final Color? borderColor;
//   final bool? contentPadding;
//   final bool textCapitalization;
//
//   const CommonTextField({
//     super.key,
//     this.regularExpression = '',
//     this.textEditController,
//     this.isValidate = true,
//     this.keyBoardType,
//     // this.validationType,
//     this.inputLength,
//     this.readOnly = false,
//     this.underLineBorder = false,
//     this.showLabel = false,
//     this.isDropdown = false,
//     this.hintText,
//     this.validationMessage,
//     this.maxLine,
//     this.sIcon,
//     this.pIcon,
//     this.preFixIconPath,
//     // this.onChange,
//     this.initialValue = '',
//     this.obscureValue,
//     this.labelText,
//     this.hasError = false,
//     this.errorMessage,
//     this.onTap,
//     this.borderColor,
//     this.contentPadding = false,
//     this.textCapitalization = false,
//   });
//
//   /// PLEASE IMPORT GET X PACKAGE
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 5),
//       child: TextFormField(
//         textCapitalization: textCapitalization
//             ? TextCapitalization.characters
//             : TextCapitalization.none,
//         controller: textEditController,
//         style: TextStyle(
//             // backgroundColor:  isDropdown == false
//             //     ? ColorUtils.greyEB
//             //     : Colors.transparent,
//             // wordSpacing: 3,
//
//             color: readOnly == true ? ColorUtils.grey0 : ColorUtils.black24,
//             fontSize: 17.sp,
//             fontFamily: FontUtils.poppins),
//         keyboardType: keyBoardType ?? TextInputType.text,
//         maxLines: maxLine ?? 1,
//
//         onTap: onTap,
//         // onChanged: onChange,
//         enabled: !readOnly!,
//         readOnly: readOnly!,
//
//         textInputAction:
//             maxLine == 4 ? TextInputAction.none : TextInputAction.done,
//         autovalidateMode: AutovalidateMode.onUserInteraction,
//         cursorColor: ColorUtils.blueC6,
//         decoration: InputDecoration(
//           contentPadding: contentPadding == false ? EdgeInsets.zero : null,
//           fillColor: ColorUtils.greyE,
//           filled: true,
//           labelText: labelText.toString().tr,
//           labelStyle: TextStyle(
//               color: ColorUtils.grey0,
//               fontSize: 17.sp,
//               fontFamily: FontUtils.poppins),
//           // enabledBorder: const UnderlineInputBorder(
//           //   borderSide: BorderSide(
//           //       color:
//           //           ColorUtils.blueC6), // Change the bottom border color here
//           // ),
//           // focusedBorder: const UnderlineInputBorder(
//           //   borderSide: BorderSide(
//           //       color:
//           //           ColorUtils.blueC6), // Change the bottom border color here
//           // ),
//           // errorStyle: TextStyle(
//           //     // color: ColorUtils.red,
//           //     fontSize: 14.sp,
//           //     fontWeight: FontWeight.w500,
//           //     fontFamily: FontUtils.poppins),
//           // errorBorder: UnderlineInputBorder(
//           //   borderSide: BorderSide(
//           //       color:
//           //           ColorUtils.redColor), // Change the bottom border color here
//           // ),
//           // focusedErrorBorder: const UnderlineInputBorder(
//           //   borderSide: BorderSide(
//           //       color:
//           //           ColorUtils.redColor), // Change the bottom border color here
//           // ),
//           // disabledBorder: UnderlineInputBorder(
//           //   borderSide: BorderSide(
//           //       color: borderColor ??
//           //           Colors.transparent), // Change the bottom border color here
//           // ),
//           errorText: hasError ? errorMessage : null,
//           suffixIcon: sIcon,
//           prefixIcon: pIcon,
//           hintText: showLabel! ? '' : hintText.toString().tr,
//           hintStyle: TextStyle(
//               color: ColorUtils.grey0,
//               fontSize: 17.sp,
//               fontFamily: FontUtils.poppins),
//         ),
//       ),
//     );
//   }
// }
