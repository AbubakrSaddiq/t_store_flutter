import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/shop/widgets/product_card_vertical.dart';
import '../../../utils/constants/sizes.dart';
import 'layout/grid_layout.dart';

class SortableProducts extends StatelessWidget {
  const SortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///search dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) {},
          items: ['Name', 'Model', 'Higher Price', 'Lower Price', 'Sale', 'Newest', 'Popularity'].map((option) => DropdownMenuItem(value: option,child: Text(option),)).toList(),
        ),
        const SizedBox(height: StoreSizes.spaceBtwItems,),
        ///products
        GridLayout(itemCount: 5, itemBuilder: (context, index) => const ProductCardVertical())
      ],
    );
  }
}
