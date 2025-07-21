import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/personalization/controllers/update_name_controller.dart';
import 'package:t_store/features/shop/widgets/appbar.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/texts.dart';
import 'package:t_store/utils/validators/validation.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(updateNameController());
    return  Scaffold(
      ///custom appbar
      appBar: StoreAppBar(
        showBackArrow: true,
        title: Text('Change Name', style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: Padding(padding: EdgeInsets.all(StoreSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Headings
            Text('Use real name', style: Theme.of(context).textTheme.labelMedium,),
            const SizedBox(height: StoreSizes.spaceBtwSections,),

            ///text field and button
            Form(key: controller.updateUsernameFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.firstName,
                      validator: (value) => StoreValidator.validateEmptyText('First Name', value),
                      expands: false,
                      decoration: InputDecoration(
                        labelText: StoreTexts.firstName,
                        prefixIcon: Icon(Iconsax.user)
                      ),
                    ),
                    const SizedBox(height: StoreSizes.spaceBtwInputFields,),
                    TextFormField(
                      controller: controller.lastName,
                      validator: (value) => StoreValidator.validateEmptyText('Last Name', value),
                      expands: false,
                      decoration: InputDecoration(
                          labelText: StoreTexts.firstName,
                          prefixIcon: Icon(Iconsax.user)
                      ),
                    ),
                    const SizedBox(height: StoreSizes.spaceBtwSections,),
                    SizedBox(width: double.infinity, child: OutlinedButton(onPressed: () => controller.updateUserName(), child: Text('Update')))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
