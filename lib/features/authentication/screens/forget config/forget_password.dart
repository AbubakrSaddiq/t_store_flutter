import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/validators/validation.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/texts.dart';
import '../../controllers/forget_password/forget_password_controller.dart';
class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(ForgetPasswordController());

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
            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                validator: StoreValidator.validateEmail,
                decoration: InputDecoration(
                    labelText: StoreTexts.email,
                    prefixIcon: const Icon(Iconsax.direct_right)),
              ),
            ),
            const SizedBox(
              height: StoreSizes.spaceBtwItems,
            ),

            ///button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.sendPasswordRestEmail(),
                child: Text(StoreTexts.resetPasswordBtn),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
