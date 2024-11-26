// import 'package:flutter/material.dart';
//
// class HoverButton extends StatefulWidget {
//   final String text;
//   final VoidCallback onPressed;
//
//   const HoverButton({
//     required this.text,
//     required this.onPressed,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<HoverButton> createState() => _HoverButtonState();
// }
//
// class _HoverButtonState extends State<HoverButton> {
//   bool isHovered = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (_) => setState(() => isHovered = true),
//       onExit: (_) => setState(() => isHovered = false),
//       child: GestureDetector(
//         onTap: widget.onPressed,
//         child: AnimatedContainer(
//           duration: const Duration(milliseconds: 200),
//           decoration: BoxDecoration(
//             color: isHovered ? Colors.blue.shade700 : Colors.blue,
//             borderRadius: BorderRadius.circular(12),
//           ),
//           padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//           child: Text(
//             widget.text,
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:bete_tselot_web/utils/color_utils.dart';
import 'package:bete_tselot_web/utils/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHoverButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomHoverButton({
    required this.text,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  _CustomHoverButtonState createState() => _CustomHoverButtonState();
}

class _CustomHoverButtonState extends State<CustomHoverButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            color: isHovered ? Colors.orange.shade400 : ColorUtils.primaryColor,
            borderRadius: BorderRadius.circular(12), // Adjust for rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: CustomText(
            widget.text,

              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
letterSpacing: 1.5,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

