import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/widgets/appbar.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/texts.dart';
import '../../widgets/layout/grid_layout.dart';
import '../../widgets/primary_header_container.dart';
import '../../widgets/product_card_vertical.dart';
import '../../widgets/promo_slider.dart';
import '../../widgets/search_bar_container.dart';
import '../../widgets/section_heading.dart';
import '../../widgets/home_app_bar.dart';
import '../../widgets/home_categories_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
             PrimaryHeaderContainer(

              child: Column(
                children: [

                  ///appbar
                  HomeAppBar(),
                  SizedBox(
                    height: StoreSizes.defaultSpace,
                  ),

                  ///searchbar
                  SearchBarContainer(
                    text: StoreTexts.searchHere,
                  ),
                  SizedBox(
                    height: StoreSizes.defaultSpace,
                  ),

                  ///categories & heading
                  ///heading
                  Padding(
                    padding:
                    EdgeInsets.only(left: StoreSizes.defaultSpace),
                    child: Column(
                      children: [
                        SectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: StoreColors.light,
                        ),
                        SizedBox(
                          height: StoreSizes.spaceBtwItems,
                        ),
                      ],
                    ),
                  ),

                  ///categories
                  HomeCategories(),
                ],
              ),

            ),

            ///body
            // Padding(
            //   padding: const EdgeInsets.all(StoreSizes.defaultSpace),
            //   child: Column(
            //     children: [
            //       ///promo slider
            //       PromoSlider(
            //         banners: [
            //           StoreImages.promo1,
            //           StoreImages.promo2,
            //           StoreImages.promo3
            //         ],
            //       ),
            //       const SizedBox(
            //         height: StoreSizes.spaceBtwSections,
            //       ),
            //
            //       ///heading
            //       SectionHeading(
            //         title: 'Popular Products',
            //         onPressed: () => Get.to(() => const AllProducts()),
            //         showActionButton: true,
            //       ),
            //       const SizedBox(
            //         height: StoreSizes.spaceBtwItems,
            //       ),
            //
            //       ///popular categories
            //       GridLayout(
            //         itemBuilder: (_, index) => const ProductCardVertical(),
            //         itemCount: 5,
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
