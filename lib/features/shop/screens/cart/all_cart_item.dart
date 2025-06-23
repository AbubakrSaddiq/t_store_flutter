import 'package:flutter/material.dart';

import '../../../../utils/constants/sizes.dart';
import '../../widgets/product_price_tag.dart';
import 'add_remove_button.dart';
import 'cart_item.dart';

class AllCartItems extends StatelessWidget {
  const AllCartItems({super.key, this.showAddRemoveButtons = true});

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(
        height: StoreSizes.spaceBtwSections,
      ),
      itemCount: 4,
      itemBuilder: (_, int index) => Column(
        children: [
          ///Image
          const CartItem(),
          if (showAddRemoveButtons) const SizedBox(
            height: StoreSizes.spaceBtwItems,
          ),
          if (showAddRemoveButtons)
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 70,
                  ),

                  ///add and remove buttons
                  ProductQtyAddRemoveButton(),
                ],
              ),

              ///price
              ProductPriceTag(price: '60,000')
            ],
          ),
        ],
      ),
    );
  }
}
