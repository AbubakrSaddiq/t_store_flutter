import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';
import '../../utils/constants/sizes.dart';

///widget for displaying an animated indicator
class StoreAnimationLoaderWidget extends StatelessWidget {
  const StoreAnimationLoaderWidget({super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed});

  final String text, animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(StoreImages.successfulPayment, width: MediaQuery
                .of(context)
                .size
                .width * 0.8),
            SizedBox(height: StoreSizes.defaultSpace,),
            Text('Welcome Note', style: Theme
                .of(context)
                .textTheme
                .bodyMedium, textAlign: TextAlign.center,),
            SizedBox(height: StoreSizes.defaultSpace,),
            showAction ? SizedBox(width: 250,
              child: OutlinedButton(
                  onPressed: onActionPressed,
                  style: OutlinedButton.styleFrom(
                      backgroundColor: StoreColors.dark),
                  child: Text(actionText!, style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(color: StoreColors.light),)),) : SizedBox()

          ],
        ));
  }
}
