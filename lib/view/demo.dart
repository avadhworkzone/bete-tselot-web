import 'package:flutter/material.dart';

class HoverUnderlineDemo extends StatelessWidget {
  const HoverUnderlineDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hover Underline Examples'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Method 1: Using HoverWidget
            HoverWidget(
              text: 'Hover Underline 1',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 30),

            // Method 2: Using MouseRegion
            MouseRegionUnderline(
              text: 'Hover Underline 2',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 30),

            // Method 3: Using Animated Underline
            AnimatedUnderlineText(
              text: 'Hover Underline 3',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 30),

            // Method 4: Using CustomPaint
            CustomUnderlineHover(
              text: 'Hover Underline 4',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Method 1: Simple Hover Widget
class HoverWidget extends StatefulWidget {
  final String text;
  final TextStyle style;

  const HoverWidget({
    required this.text,
    required this.style,
    super.key,
  });

  @override
  State<HoverWidget> createState() => _HoverWidgetState();
}

class _HoverWidgetState extends State<HoverWidget> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Text(
        widget.text,
        style: widget.style.copyWith(
          decoration: isHovered ? TextDecoration.underline : TextDecoration.none,
          decorationThickness: 2,
        ),
      ),
    );
  }
}

// Method 2: MouseRegion with Custom Animation
class MouseRegionUnderline extends StatefulWidget {
  final String text;
  final TextStyle style;

  const MouseRegionUnderline({
    required this.text,
    required this.style,
    super.key,
  });

  @override
  State<MouseRegionUnderline> createState() => _MouseRegionUnderlineState();
}

class _MouseRegionUnderlineState extends State<MouseRegionUnderline> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(widget.text, style: widget.style),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: isHovered ? 200 : 0,
            height: 2,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}

// Method 3: Animated Underline
class AnimatedUnderlineText extends StatefulWidget {
  final String text;
  final TextStyle style;

  const AnimatedUnderlineText({
    required this.text,
    required this.style,
    super.key,
  });

  @override
  State<AnimatedUnderlineText> createState() => _AnimatedUnderlineTextState();
}

class _AnimatedUnderlineTextState extends State<AnimatedUnderlineText> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Stack(
        children: [
          Text(widget.text, style: widget.style),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: 2,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.orange,
                    Colors.deepOrange,
                  ],
                ),
                // transform: Matrix4.translationValues(
                //   isHovered ? 0 : -200,
                //   0,
                //   0,
                // ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Method 4: Custom Paint Underline
class CustomUnderlineHover extends StatefulWidget {
  final String text;
  final TextStyle style;

  const CustomUnderlineHover({
    required this.text,
    required this.style,
    super.key,
  });

  @override
  State<CustomUnderlineHover> createState() => _CustomUnderlineHoverState();
}

class _CustomUnderlineHoverState extends State<CustomUnderlineHover>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => isHovered = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => isHovered = false);
        _controller.reverse();
      },
      child: CustomPaint(
        painter: UnderlinePainter(progress: _animation),
        child: Text(widget.text, style: widget.style),
      ),
    );
  }
}

class UnderlinePainter extends CustomPainter {
  final Animation<double> progress;

  UnderlinePainter({required this.progress}) : super(repaint: progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    final lineWidth = size.width * progress.value;
    final startX = (size.width - lineWidth) / 2;

    canvas.drawLine(
      Offset(startX, size.height + 5),
      Offset(startX + lineWidth, size.height + 5),
      paint,
    );
  }

  @override
  bool shouldRepaint(UnderlinePainter oldDelegate) => true;
}