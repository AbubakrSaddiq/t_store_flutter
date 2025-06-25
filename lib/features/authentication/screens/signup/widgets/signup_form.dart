import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/authentication/screens/signup/verify_email.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../../../utils/validators/validation.dart';
import '../../../controllers/signup/signup_controller.dart';
import '../../login/widgets/social_widgets.dart';
import 'Terms_and_condition_checkbox.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = StoreHelperFunction.isDarkMode(context);
    final controller = Get.put(SignUpController());

    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          ///first name and last name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      StoreValidator.validateEmptyText('First Name', value),
                  expands: false,
                  decoration: InputDecoration(
                      labelText: StoreTexts.firstName,
                      prefixIcon: const Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(
                width: StoreSizes.spaceBtwItems,
              ),
              Expanded(
                child: TextFormField(
                  validator: (value) =>
                      StoreValidator.validateEmptyText('Last Name', value),
                  controller: controller.lastName,
                  expands: false,
                  decoration: InputDecoration(
                      labelText: StoreTexts.lastName,
                      prefixIcon: const Icon(Iconsax.user)),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: StoreSizes.spaceBtwItems,
          ),

          ///username
          TextFormField(
            validator: (value) =>
                StoreValidator.validateEmptyText('Username', value),
            controller: controller.username,
            expands: false,
            decoration: InputDecoration(
                labelText: StoreTexts.username,
                prefixIcon: const Icon(Iconsax.user_edit)),
          ),
          const SizedBox(
            height: StoreSizes.spaceBtwItems,
          ),

          ///email
          TextFormField(
            validator: (value) => StoreValidator.validateEmail(value),
            controller: controller.email,
            decoration: InputDecoration(
                labelText: StoreTexts.email,
                prefixIcon: const Icon(Iconsax.direct_inbox)),
          ),
          const SizedBox(
            height: StoreSizes.spaceBtwItems,
          ),

          ///phone number
          TextFormField(
            validator: (value) => StoreValidator.validatePhoneNumber(value),
            controller: controller.phoneNumber,
            decoration: InputDecoration(
                labelText: StoreTexts.phoneNumber,
                prefixIcon: const Icon(Iconsax.call)),
          ),
          const SizedBox(
            height: StoreSizes.spaceBtwItems,
          ),

          ///password
          Obx(
            () => TextFormField(
              validator: (value) => StoreValidator.validatePassword(value),
              controller: controller.password,
              obscureText: controller.hideShowPassword.value,
              decoration: InputDecoration(
                  labelText: StoreTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                      onPressed: () => controller.hideShowPassword.value = !controller.hideShowPassword.value,
                      icon: Icon(controller.hideShowPassword.value ? Iconsax.eye_slash : Iconsax.eye))),
            ),
          ),
          const SizedBox(
            height: StoreSizes.spaceBtwItems,
          ),

          ///terms&conditions checkbox
          TermsAndConditionCheckBox(),

          ///signup button
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.signup(),
                  child: Text(StoreTexts.signUpBtn))),
          const SizedBox(
            height: StoreSizes.spaceBtwItems,
          ),

          ///divider
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Divider(
                  color: dark ? StoreColors.darkGrey : StoreColors.grey,
                  thickness: 0.5,
                  indent: 60,
                  endIndent: 5,
                ),
              ),
              Text(
                StoreTexts.orSignUpWith,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Flexible(
                child: Divider(
                  color: dark ? StoreColors.darkGrey : StoreColors.grey,
                  thickness: 0.5,
                  indent: 5,
                  endIndent: 60,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: StoreSizes.spaceBtwSections,
          ),

          ///footer
          ///social icon
          const socialButtons()
        ],
      ),
    );
  }
}
