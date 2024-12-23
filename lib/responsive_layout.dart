import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget desktopBody;

  const ResponsiveLayout({
    super.key,
    required this.mobileBody,
    required this.desktopBody,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // if (constraints.maxWidth < 500) {
        //   return mobileBody;
        // } else if (constraints.maxWidth < 800) {
        //   return tabletBody;
        // } else {
        //   return desktopBody;
        // }
        if (constraints.maxWidth < 800) {
          return mobileBody;
        }  else {
          return desktopBody;
        }
      },
    );
  }
}
