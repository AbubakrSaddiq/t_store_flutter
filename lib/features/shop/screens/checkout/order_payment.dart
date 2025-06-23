import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../widgets/rounded_container.dart';
import '../../widgets/section_heading.dart';

class OrderPaymentSection extends StatelessWidget {
  const OrderPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = StoreHelperFunction.isDarkMode(context);
    return Column(
      children: [
        SectionHeading(title: 'Payment Method', buttonTitle: 'Change', onPressed: (){},),
        const SizedBox(height: StoreSizes.spaceBtwItems,),
        Row(
          children: [
            RoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? StoreColors.light : StoreColors.white,
              padding: const EdgeInsets.all(StoreSizes.sm),
              child: Image(image: AssetImage(StoreImages.cardPayment), fit: BoxFit.contain,),
            ),
            const SizedBox(width: StoreSizes.spaceBtwItems,),
            Text('MasterCard', style: Theme.of(context).textTheme.bodyLarge,)
          ],
        ),

      ],
    );
  }
}
