import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:t_store/common/styles/spacing_styles.dart';
import 'package:t_store/utils/constants/sizes.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.onPressed,
  });

  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: StoreSpacingStyle.paddingWithAppBarHeight * 2,
        child: Column(
          children: [
            ///image
            Lottie.asset(image, width: MediaQuery.of(context).size.width * 0.6),
            const SizedBox(height: StoreSizes.spaceBtwSections,),

            ///title and subTitle
            Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
            const SizedBox(height: StoreSizes.spaceBtwItems,),
            Text(subTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
            const SizedBox(height: StoreSizes.spaceBtwSections,),

            ///buttons
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: onPressed, child: const Text('Continue')),
            )
          ],
        ),
        ),
      ),
    );
  }
}
