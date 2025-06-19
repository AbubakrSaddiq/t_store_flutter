import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/texts.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../login/login.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.back(), icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(StoreSizes.defaultSpace),
          child: Column(
            children: [
              ///image
              Image(image: AssetImage(StoreImages.verifyEmailArrived), width: StoreHelperFunction.screenWidth() * 0.6,),
              const SizedBox(height: StoreSizes.spaceBtwItems,),
              ///title and sub title
              Text(StoreTexts.resetPasswordEmailSent, style: Theme.of(context).textTheme.headlineMedium,),
              const SizedBox(height: StoreSizes.spaceBtwSections * 5,),
              ///button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.off(() => const LoginScreen()),
                  child: Text(StoreTexts.done),
                ),
              ),
              const SizedBox(height: StoreSizes.spaceBtwItems,),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all(Colors.white70),
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
