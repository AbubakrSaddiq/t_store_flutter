import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/sizes.dart';
import '../../widgets/appbar.dart';
import '../../widgets/brand_card.dart';
import '../../widgets/layout/grid_layout.dart';
import '../../widgets/section_heading.dart';
import 'branded_products.dart';

class AllBrands extends StatelessWidget {
  const AllBrands({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StoreAppBar(
        title: Text('Brand'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(StoreSizes.defaultSpace),
          child: Column(
            children: [
              const SectionHeading(
                title: 'Brands',
                showActionButton: false,
              ),
              const SizedBox(
                height: StoreSizes.spaceBtwItems,
              ),

              ///list of brands
              GridLayout(
                  itemCount: 4,
                  mainAxisExtent: 80,
                  itemBuilder: (_, __) => BrandCard(showBorder: true, onTap: () => Get.to(() => const BrandedProducts()),))
            ],
          ),
        ),
      ),
    );
  }
}
