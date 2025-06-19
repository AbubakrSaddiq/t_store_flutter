import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/authentication/screens/forget%20config/reset_password.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/texts.dart';
class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(StoreSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///title and sub title
            Text(
              StoreTexts.forgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: StoreSizes.spaceBtwItems,
            ),
            Text(
              StoreTexts.forgetPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: StoreSizes.spaceBtwItems * 2,
            ),

            ///text field
            TextFormField(
              decoration: InputDecoration(
                  labelText: StoreTexts.email,
                  prefixIcon: const Icon(Iconsax.direct_right)),
            ),
            const SizedBox(
              height: StoreSizes.spaceBtwItems,
            ),

            ///button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.off(() => const ResetPassword()),
                child: Text(StoreTexts.resetPasswordBtn),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
