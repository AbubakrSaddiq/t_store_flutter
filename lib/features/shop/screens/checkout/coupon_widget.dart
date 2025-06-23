import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../widgets/rounded_container.dart';

class CouponWidget extends StatelessWidget {
  const CouponWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {

    final  dark = StoreHelperFunction.isDarkMode(context);

    return RoundedContainer(
      showBorder: true,
      backgroundColor: dark ? StoreColors.dark : StoreColors.white,
      padding: const EdgeInsets.only(top: StoreSizes.sm, bottom: StoreSizes.sm, right: StoreSizes.sm, left: StoreSizes.md),
      child: Row(
        children: [
          const Flexible(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Coupon promo code",
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              )),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                foregroundColor: dark ? StoreColors.white.withOpacity(0.5) : StoreColors.dark.withOpacity(0.5),
                backgroundColor: StoreColors.grey.withOpacity(0.2),
                side: BorderSide(color: StoreColors.grey.withOpacity(0.1))
            ),
            child: const Text('Apply'),
          ),
        ],
      ),
    );
  }
}
