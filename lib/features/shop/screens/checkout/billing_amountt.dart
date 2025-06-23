import 'package:flutter/material.dart';
import '../../../../utils/constants/sizes.dart';

class BillingPaymentAmountSection extends StatelessWidget {
  const BillingPaymentAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///sub total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal' , style: Theme.of(context).textTheme.bodyMedium,),
            Text('N56,500' , style: Theme.of(context).textTheme.labelLarge,),
          ],
        ),
        ///tax fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax Fee' , style: Theme.of(context).textTheme.bodyMedium,),
            Text('N500' , style: Theme.of(context).textTheme.labelLarge,),
          ],
        ),
        ///shipping cost
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Fess' , style: Theme.of(context).textTheme.bodyMedium,),
            Text('N1,500' , style: Theme.of(context).textTheme.labelLarge,),
          ],
        ),
        const SizedBox(height: StoreSizes.spaceBtwItems/2,),
        ///order total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total' , style: Theme.of(context).textTheme.bodyMedium,),
            Text('N57,000' , style: Theme.of(context).textTheme.titleLarge,),
          ],
        ),
      ],
    );
  }
}
