import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/sizes.dart';
import 'brand_title_text.dart';

class BrandTextWithVerifiedIcon extends StatelessWidget {
  const BrandTextWithVerifiedIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.iconColor,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
    this.textColor,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
            child: BrandTitleText(
          title: title,
          color: textColor,
          maxLines: maxLines,
          textAlign: textAlign,
          brandTextSize: brandTextSize,
        )),
        const SizedBox(
          width: StoreSizes.xs,
        ),
        Icon(
          Iconsax.verify5,
          color: StoreColors.primary,
          size: StoreSizes.iconXs,
        )
      ],
    );
  }
}
