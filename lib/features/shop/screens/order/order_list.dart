import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../widgets/rounded_container.dart';

class OrderListItems extends StatelessWidget {
  const OrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = StoreHelperFunction.isDarkMode(context);
    return ListView.separated(
      itemCount: 10,
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(height: StoreSizes.spaceBtwItems,),
      itemBuilder: (_, index) => RoundedContainer(
        showBorder: true,
        padding: const EdgeInsets.all(StoreSizes.md),
        backgroundColor: dark ? StoreColors.dark : StoreColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ///icon, status and date
            Row(
              children: [
                ///icon
                const Icon(Iconsax.ship),
                const SizedBox(
                  width: StoreSizes.spaceBtwItems / 2,
                ),

                ///status and date
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Processing',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(color: StoreColors.primary),
                      ),
                      Text(
                        '06 Feb, 2025',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ),

                ///more icon
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Iconsax.arrow_right_34,
                    size: StoreSizes.iconSm,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: StoreSizes.spaceBtwItems,
            ),
          ///order no, shipping date
            Row(
              children: [
                const Icon(Icons.tag),
                const SizedBox(
                  width: StoreSizes.spaceBtwItems / 2,
                ),
                ///order number
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order No.',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Text(
                        '5689',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ),

                ///shipping date
                const Icon(Iconsax.calendar),
                const SizedBox(
                  width: StoreSizes.spaceBtwItems / 2,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shipping Date',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Text(
                      '07 Feb, 2025',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
