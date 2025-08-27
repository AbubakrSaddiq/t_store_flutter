import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/controllers/category_controller.dart';
import 'package:t_store/features/shop/screens/all_brands/all_brands.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../widgets/appbar.dart';
import '../../widgets/brand_card.dart';
import '../../widgets/cart_menu_icon.dart';
import '../../widgets/category_tab.dart';
import '../../widgets/layout/grid_layout.dart';
import '../../widgets/search_bar_container.dart';
import '../../widgets/section_heading.dart';
import '../../widgets/tab_bar.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = StoreHelperFunction.isDarkMode(context);
    final categories = CategoryController.instance.featuredCategories;

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: StoreAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            StoreCartCounterIcon(
              onPressed: () {},
              iconColor: dark ? StoreColors.light : StoreColors.dark,
            ),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: dark ? StoreColors.black : StoreColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(StoreSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      ///search bar
                      const SearchBarContainer(
                        text: 'Search Store',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(height: StoreSizes.spaceBtwSections),

                      ///featured brands
                      SectionHeading(
                        title: 'Featured Brands',
                        onPressed: () => Get.to(() => AllBrands()),
                      ),
                      const SizedBox(height: StoreSizes.spaceBtwItems / 1.5),
                      GridLayout(
                        itemCount: 4,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) {
                          return const BrandCard(showBorder: true);
                        },
                      ),
                    ],
                  ),
                ),

                /// tabs
                bottom: StoreTabBar(
                  dark: dark,
                  tabs: categories.map((categories) => Tab(child: Text(categories.name))).toList()
                ),
              ),
            ];
          },

          ///body
          body:  TabBarView(children: categories.map((category) => CategoryTab(category: category,)).toList()),
        ),
      ),
    );
  }
}
