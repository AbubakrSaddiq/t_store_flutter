import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/screens/cart/cart.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/texts.dart';
import 'appbar.dart';
import 'cart_menu_icon.dart';


class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StoreAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(StoreTexts.homeAppBarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: StoreColors.white),),
          Text(StoreTexts.homeAppBarSubtitle, style: Theme.of(context).textTheme.headlineSmall!.apply(color: StoreColors.white),),
        ],
      ),
      ///shopping cart icon and number
      actions: [
        StoreCartCounterIcon(iconColor: StoreColors.white, onPressed: () => Get.to(() =>  CartScreen()),)
      ],
    );
  }
}
