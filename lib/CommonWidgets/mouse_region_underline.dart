import 'package:flutter/material.dart';

class HoverUnderlineText extends StatefulWidget {
  final String text;
  final TextStyle style;

  const HoverUnderlineText({
    required this.text,
    required this.style,
    super.key,
  });

  @override
  _HoverUnderlineTextState createState() => _HoverUnderlineTextState();
}

class _HoverUnderlineTextState extends State<HoverUnderlineText> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Text(widget.text, style: widget.style),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: isHovered ? 1 : 0,
            width: isHovered
                ? (TextPainter(
              text: TextSpan(text: widget.text, style: widget.style),
              maxLines: 1,
              textDirection: TextDirection.ltr,
            )..layout())
                .size
                .width
                : 0,
            color: widget.style.color ?? Colors.black,
          ),
        ],
      ),
    );
  }
}
