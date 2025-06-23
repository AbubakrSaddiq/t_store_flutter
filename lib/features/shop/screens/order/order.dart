import 'package:flutter/material.dart';
import '../../../../utils/constants/sizes.dart';
import '../../widgets/appbar.dart';
import 'order_list.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///appbar
      appBar: StoreAppBar(
        title: Text(
          'My Orders',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(StoreSizes.defaultSpace),
        ///orders
        child: OrderListItems(),
      ),

    );
  }
}
