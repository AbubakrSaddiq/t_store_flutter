import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/device/device_utility.dart';

class StoreTabBar extends StatelessWidget implements PreferredSizeWidget {
  const StoreTabBar({
    super.key,
    required this.dark,
    required this.tabs,
  });

  final bool dark;
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return TabBar(
        isScrollable: true,
        indicatorColor: StoreColors.primary,
        unselectedLabelColor: StoreColors.grey,
        labelColor: dark ? StoreColors.white : StoreColors.primary,
        tabs: tabs,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(StoreDeviceUtils.getAppBarHeight());
}
