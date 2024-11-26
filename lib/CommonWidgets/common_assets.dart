import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class LocalAssets extends StatelessWidget {
  const LocalAssets(
      {super.key,
      required this.imagePath,
      this.height,
      this.width,
      this.imgColor,
      this.boxFit,
      this.scaleSize});
  final String imagePath;
  final double? height, width, scaleSize;
  final Color? imgColor;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return imagePath.split('.').last != 'svg'
        ? Image.asset(
            imagePath,
            height: height,
            width: width,
            scale: scaleSize,
            color: imgColor,
            fit: boxFit,
          )
        : SvgPicture.asset(
            imagePath,
            height: height,
            width: width,
            color: imgColor,
          );
  }
}

