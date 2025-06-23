import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

    return DefaultTabController(
      length: 5,
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
                        onPressed: () {},
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
                  tabs: const [
                    Tab(child: Text('Store')),
                    Tab(child: Text('Electronics')),
                    Tab(child: Text('Fashion')),
                    Tab(child: Text('Sports')),
                    Tab(child: Text('Toys')),
                  ],
                ),
              ),
            ];
          },

          ///body
          body: const TabBarView(children: [CategoryTab()]),
        ),
      ),
    );
  }
}
