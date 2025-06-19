import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/shop/widgets/rounded_container.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = StoreHelperFunction.isDarkMode(context);
    return RoundedContainer(
      width: double.infinity,
      padding: const EdgeInsets.all(StoreSizes.md),
      showBorder: true,
      backgroundColor: selectedAddress
          ? StoreColors.primary.withOpacity(0.5)
          : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
              ? StoreColors.darkerGrey
              : StoreColors.grey,
      margin: const EdgeInsets.only(bottom: StoreSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 5,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress
                  ? dark
                      ? StoreColors.light
                      : StoreColors.dark
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ya'u Hudu",
                style: Theme.of(context).textTheme.titleLarge,
                overflow: TextOverflow.ellipsis,
              ),
              const Text(
                '+234 703 456 7890',
                overflow: TextOverflow.ellipsis,
              ),
              const Text(
                'Kofar Fada Ta Kudu, Bayan Gidan Galadima, Gombe St.',
                softWrap: true,
              )
            ],
          )
        ],
      ),
    );
  }
}
