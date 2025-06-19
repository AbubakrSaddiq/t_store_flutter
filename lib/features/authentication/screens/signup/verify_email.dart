import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/texts.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../login/login.dart';
import 'email_success_screen.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, actions: [
        IconButton(
            onPressed: () => Get.offAll(() => const LoginScreen()),
            icon: const Icon(CupertinoIcons.clear))
      ]),
      body: SingleChildScrollView(
        //padding to give default equal space on all sides in all screens
        child: Padding(
          padding: const EdgeInsets.all(StoreSizes.defaultSpace),
          child: Column(
            children: [
              ///image
              Image(
                image: AssetImage(StoreImages.accountSuccess),
                width: StoreHelperFunction.screenWidth() * 0.6,
              ),
              const SizedBox(
                height: StoreSizes.spaceBtwSections,
              ),

              ///title and subtitle
              Text(
                StoreTexts.verifyEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: StoreSizes.spaceBtwItems,
              ),
              Text(
                StoreTexts.yourEmailAddress,
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: StoreSizes.spaceBtwItems,
              ),
              Text(
                StoreTexts.emailAwait,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: StoreSizes.spaceBtwSections,
              ),

              ///buttons
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Get.to(() => const EmailSuccessScreen()),
                    child: Text(StoreTexts.continueButton),
                  )),
              const SizedBox(
                height: StoreSizes.spaceBtwSections,
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white70),
                  ),
                  child: Text(
                    StoreTexts.resendEmailBtn,
                    style: const TextStyle(color: Colors.blueAccent),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
