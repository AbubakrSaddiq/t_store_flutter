import 'package:flutter/material.dart';
import '../../../../utils/constants/sizes.dart';
import '../../widgets/section_heading.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeading(title: 'Shipping Address', buttonTitle: 'Change', onPressed: (){},),
        Text('Estel Enterprise', style: Theme.of(context).textTheme.bodyLarge,),
        const SizedBox(height: StoreSizes.spaceBtwItems,),
        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey,),
            const SizedBox(width: StoreSizes.spaceBtwItems,),
            Text('+234 803 3456 345', style: Theme.of(context).textTheme.bodyMedium)
          ],
        ),
        const SizedBox(height: StoreSizes.spaceBtwItems,),
        Row(
          children: [
            const Icon(Icons.location_city, color: Colors.grey,),
            const SizedBox(width: StoreSizes.spaceBtwItems,),
            Text('Idu Industrial Layout, Abuja', style: Theme.of(context).textTheme.bodyMedium)
          ],
        ),
      ],
    );
  }
}
