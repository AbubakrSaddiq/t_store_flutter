import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/authentication/screens/signup/email_success_screen.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../widgets/appbar.dart';
import '../../widgets/navigation_menu.dart';
import '../../widgets/rounded_container.dart';
import '../cart/all_cart_item.dart';
import 'billing_address.dart';
import 'billing_amountt.dart';
import 'coupon_widget.dart';
import 'order_payment.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = StoreHelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: StoreAppBar(
        showBackArrow: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(StoreSizes.defaultSpace),
          child: Column(
            children: [
              ///all items in cart
              const AllCartItems(showAddRemoveButtons: false),

              ///coupon field
              const CouponWidget(),
              const SizedBox(height: StoreSizes.spaceBtwSections),

              ///billing
              RoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(StoreSizes.defaultSpace),
                backgroundColor: dark ? StoreColors.black : StoreColors.white,
                child: const Column(
                  children: [
                    ///pricing
                    BillingPaymentAmountSection(),
                    SizedBox(height: StoreSizes.spaceBtwItems),

                    ///divider
                    Divider(),
                    SizedBox(height: StoreSizes.spaceBtwItems),

                    ///payment
                    OrderPaymentSection(),
                    SizedBox(height: StoreSizes.spaceBtwItems),

                    ///address
                    BillingAddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(StoreSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(
            () => EmailSuccessScreen(
              image: StoreImages.successfulPayment,
              title: 'Payment Success',
              subTitle: 'Your item is on its way',
              onPressed: () => Get.offAll(() => NavigationMenu()),
            ),
          ),
          child: const Text('Checkout N57,000'),
        ),
      ),
    );
  }
}
