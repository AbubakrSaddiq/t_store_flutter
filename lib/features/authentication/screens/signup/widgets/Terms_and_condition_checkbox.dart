import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TermsAndConditionCheckBox extends StatelessWidget {
  const TermsAndConditionCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = StoreHelperFunction.isDarkMode(context);
    // final controller = SignUpController.instance;

    return Row(
      children: [
        // SizedBox(
        //     width: 24,
        //     height: StoreSizes.spaceBtwSections * 1.5,
        //     child: Obx(() => Checkbox(
        //         value: controller.privacyPolicy.value,
        //         onChanged: (value) => controller.privacyPolicy.value =
        //             !controller.privacyPolicy.value))),
        SizedBox(
          width: 24,
          height: StoreSizes.spaceBtwSections * 1.5,
          child: Checkbox(value: true, onChanged: (value){}),
        ),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: StoreTexts.iAgreeTo,
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: StoreTexts.privacyPolicy,
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? StoreColors.light : StoreColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor:
                      dark ? StoreColors.light : StoreColors.primary)),
          TextSpan(
              text: StoreTexts.and,
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: StoreTexts.termsOfUse,
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? StoreColors.light : StoreColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor:
                      dark ? StoreColors.light : StoreColors.primary)),
        ])),
      ],
    );
  }
}
