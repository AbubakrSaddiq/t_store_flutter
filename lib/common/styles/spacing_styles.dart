
import 'package:flutter/cupertino.dart';
import '../../utils/constants/sizes.dart';

class StoreSpacingStyle{
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: StoreSizes.appBarHeight,
    left: StoreSizes.defaultSpace,
    right: StoreSizes.defaultSpace,
    bottom: StoreSizes.defaultSpace,
  );
}