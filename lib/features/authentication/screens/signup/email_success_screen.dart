import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/styles/spacing_styles.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/texts.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../login/login.dart';

class EmailSuccessScreen extends StatelessWidget {
  const EmailSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: StoreSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              ///image
              Image(image: AssetImage(StoreImages.accountSuccess), width: StoreHelperFunction.screenWidth() * 0.6,),
              const SizedBox(height: StoreSizes.spaceBtwSections,),
              ///title
              Text(StoreTexts.accountSuccessCreated, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
              const SizedBox(height: StoreSizes.spaceBtwSections * 5,),
              ///button
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Get.to(() => const LoginScreen()),
                    child: Text(StoreTexts.continueButton),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
