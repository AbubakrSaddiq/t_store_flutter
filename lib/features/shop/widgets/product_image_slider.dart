import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/shop/widgets/rounded_image.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import 'appbar.dart';
import 'circular_icon.dart';
import 'curved_edges_widget.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = StoreHelperFunction.isDarkMode(context);

    return CurvedEdgeWidget(
      child: Container(
        color: dark ? StoreColors.darkerGrey : StoreColors.light,
        child: Stack(
          children: [
            ///main large image
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(
                    StoreSizes.productImageRadius * 4),
                child: Center(
                    child:
                    Image(image: AssetImage(StoreImages.prod11))),
              ),
            ),
            ///image slider
            Positioned(
              right: 0,
              bottom: 30,
              left: StoreSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  separatorBuilder: (_, __) => const SizedBox(width: StoreSizes.spaceBtwItems / 2,),
                  itemCount: 6,
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) => RoundedImage(
                    width: 80,
                    border: Border.all(color: StoreColors.primary),
                    backgroundColor:
                    dark ? StoreColors.dark : StoreColors.light,
                    padding: const EdgeInsets.all(StoreSizes.sm),
                    imageUrl: StoreImages.prod6,
                  ),
                ),
              ),
            ),
            ///appbar icon
            const StoreAppBar(showBackArrow: true,
              actions: [
                CircularIcon(icon: Iconsax.heart5, color: Colors.red,)
              ],)
          ],
        ),
      ),
    );
  }
}
