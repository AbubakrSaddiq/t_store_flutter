import 'package:flutter/material.dart';
import 'package:t_store/features/shop/widgets/circular_image.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class VerticalImageText extends StatelessWidget {
  const VerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = StoreColors.white,
    this.backgroundColor,
    this.onTap,
    this.isNetworkImage = true
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {

    final dark = StoreHelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: StoreSizes.spaceBtwItems),
        child: Column(

          children: [
            ///circular icon
           CircularImage(image: image,
           fit: BoxFit.fitWidth,
           padding: StoreSizes.sm * 1.4,
           isNetworkImage: isNetworkImage,
           backgroundColor: backgroundColor,
           overlayColor: StoreHelperFunction.isDarkMode(context) ? StoreColors.light : StoreColors.dark,),

            // Container(
            //   width: 56,
            //   height: 56,
            //   padding: const EdgeInsets.all(StoreSizes.sm),
            //   decoration: BoxDecoration(
            //       color: backgroundColor ?? (dark ? StoreColors.black : StoreColors.white),
            //       borderRadius: BorderRadius.circular(100)),
            //   child: Center(
            //     child: Image(
            //       image: AssetImage(image),
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: StoreSizes.spaceBtwItems / 2,
            ),

            ///text
            SizedBox(
                width: 55,
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: textColor),
                  textAlign: TextAlign.center,
                ))
          ],
        ),
      ),
    );
  }
}
