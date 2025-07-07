import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/authentication/screens/forget%20config/forget_password.dart';
import 'package:t_store/features/authentication/screens/signup/signup.dart';

import '../../../../shop/widgets/navigation_menu.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import 'social_widgets.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = StoreHelperFunction.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///logo
        // Icon(Iconsax.icon),
        Image(
          height: StoreHelperFunction.screenHeight() * 0.1,
          width: StoreHelperFunction.screenWidth() * 0.1,
          image: AssetImage(
              dark ? StoreImages.lightAppLogo : StoreImages.darkAppLogo,
          ),
        ),
        Text(
          StoreTexts.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: StoreSizes.sm,
        ),
        Text(
          StoreTexts.loginSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),

        ///  form
        Form(
            child: Padding(
              padding:
              const EdgeInsets.symmetric(vertical: StoreSizes.spaceBtwSections),
              child: Column(
                children: [
                  ///Email
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: StoreTexts.email,
                        prefixIcon: const Icon(Iconsax.direct_right)),
                  ),
                  const SizedBox(
                    height: StoreSizes.spaceBtwItems,
                  ),

                  ///Password
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: StoreTexts.password,
                        prefixIcon: const Icon(Iconsax.password_check),
                        suffixIcon: const Icon(Iconsax.eye_slash)),
                  ),
                  const SizedBox(
                    height: StoreSizes.spaceBtwItems / 2,
                  ),

                  ///Remember me and forget password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ///Remember me
                      Row(
                        children: [
                          Checkbox(value: true, onChanged: (value) {}),
                          Text(StoreTexts.rememberMe),
                        ],
                      ),
                      ///forget password
                      TextButton(
                          onPressed: () => Get.to(() => ForgetPassword()),
                          child: Text(StoreTexts.forgetPassword)),
                    ],
                  ),
                  const SizedBox(
                    height: StoreSizes.spaceBtwSections,
                  ),

                  ///sign in button
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () => Get.to(() => NavigationMenu()), child: Text(StoreTexts.signIn))),

                  const SizedBox(
                    height: StoreSizes.spaceBtwItems,
                  ),

                  ///create account button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () => Get.to(() => const SignupScreen()),

                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Colors.white70),
                      ),
                      child: Text(
                        StoreTexts.createAccount,
                        style: const TextStyle(color: Colors.blueAccent),
                      ),
                    ),
                  ),
                ],
              ),
            )),

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
              StoreTexts.orSignInWith,
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
        const SizedBox(height: StoreSizes.spaceBtwSections,),
        ///footer
        ///google icon
        const socialButtons()
      ],
    );
  }
}

