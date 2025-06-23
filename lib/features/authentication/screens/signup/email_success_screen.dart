import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/styles/spacing_styles.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/texts.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../login/login.dart';

class EmailSuccessScreen extends StatelessWidget {
  const EmailSuccessScreen({
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
        child: Padding(
          padding: StoreSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              ///image
              Image(
                image: AssetImage(image),
                width: StoreHelperFunction.screenWidth() * 0.6,
              ),
              const SizedBox(height: StoreSizes.spaceBtwSections),

              ///title and subtitle
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),

              Text(
                subTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ), const SizedBox(height: StoreSizes.spaceBtwSections ),
              ///button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: Text(StoreTexts.continueButton),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
