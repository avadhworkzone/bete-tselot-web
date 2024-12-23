import 'package:bete_tselot_web/utils/color_utils.dart';
import 'package:bete_tselot_web/utils/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHoverButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Color? hoverColor;

  const CustomHoverButton({
    required this.text,
    required this.onPressed,
    super.key,this.padding, this.color, this.hoverColor,
  });

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
          padding: widget.padding?? EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
          decoration: BoxDecoration(
            color: isHovered ? widget.hoverColor ?? Colors.orange.shade400 : widget.color ?? ColorUtils.primaryColor,
            borderRadius: BorderRadius.circular(12), // Adjust for rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child : CustomText(
            widget.text,
            fontSize: 13.sp,
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

