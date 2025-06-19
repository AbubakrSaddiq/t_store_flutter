import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer(
      {super.key,
      this.width,
      this.height,
      this.radius = StoreSizes.cardRadiusLg,
      this.padding,
      this.backgroundColor = StoreColors.white,
      this.borderColor = StoreColors.borderPrimary,
      this.showBorder = false,
      this.child,
      this.margin});

  final double? width;
  final double? height;
  final double radius;
  final EdgeInsetsGeometry? padding;
  final Color backgroundColor;
  final Color borderColor;
  final bool showBorder;
  final Widget? child;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
