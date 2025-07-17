import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class StoreShimmer extends StatelessWidget {
  const StoreShimmer({
    super.key,
    required this.width,
    required this.height,
    this.color,
     this.radius = 15,
  });

  final double width, height, radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final dark = StoreHelperFunction.isDarkMode(context);
    return Shimmer.fromColors(
      child: Container(
        width: width, height: height,
        decoration: BoxDecoration(
          color: color ?? (dark ? StoreColors.darkerGrey : StoreColors.white),
          borderRadius: BorderRadius.circular(radius)
        ),
      ),
      baseColor: dark ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!,
    );
  }
}
