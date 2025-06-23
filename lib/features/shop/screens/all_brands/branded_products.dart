import 'package:flutter/material.dart';
import '../../../../utils/constants/sizes.dart';
import '../../widgets/appbar.dart';
import '../../widgets/brand_card.dart';
import '../../widgets/sortable_products.dart';

class BrandedProducts extends StatelessWidget {
  const BrandedProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: StoreAppBar(title: Text('NASENI'), showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(StoreSizes.defaultSpace),
          child: Column(
            children: [
              BrandCard(showBorder: true),
              SizedBox(height: StoreSizes.spaceBtwItems,),
              SortableProducts()
            ],
          ),
        ),
      ),
    );
  }
}
