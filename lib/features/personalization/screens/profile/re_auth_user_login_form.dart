import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/features/shop/widgets/appbar.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/texts.dart';
import 'package:t_store/utils/validators/validation.dart';

class ReAuthLoginForms extends StatelessWidget {
  const ReAuthLoginForms({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Scaffold(
      appBar: StoreAppBar(title: Text('Re-Authenticate User')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(StoreSizes.defaultSpace),

          ///form
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///email
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: StoreValidator.validateEmail,
                  decoration: InputDecoration(
                    labelText: StoreTexts.email,
                    prefixIcon: Icon(Iconsax.direct_right),
                  ),
                ),
                const SizedBox(height: StoreSizes.spaceBtwInputFields),

                ///password
                Obx(
                  () => TextFormField(
                    obscureText: controller.hidePassword.value,
                    controller: controller.verifyPassword,
                    validator: (value) =>
                        StoreValidator.validateEmptyText('Password', value),
                    decoration: InputDecoration(
                      labelText: StoreTexts.password,
                      prefixIcon: Icon(Iconsax.password_check),
                      suffixIcon: IconButton(
                        onPressed: () =>
                            controller.hidePassword.value !=
                            !controller.hidePassword.value,
                        icon: const Icon(Iconsax.eye_slash),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: StoreSizes.spaceBtwInputFields),

                ///login button
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () =>
                        controller.reAuthenticateEmailAndPassword(),
                    child: Text('Verify'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
