import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/sizes.dart';
import '../../widgets/appbar.dart';
import '../../widgets/layout/grid_layout.dart';
import '../../widgets/product_card_vertical.dart';
import '../home/home.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(Iconsax.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(StoreSizes.defaultSpace),
          child: Column(
            children: [
              GridLayout(itemCount: 3, itemBuilder: (_, index) => const ProductCardVertical())
            ],
          ),
        ),
      ),
    );
  }
}
