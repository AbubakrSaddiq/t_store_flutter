import 'package:flutter/material.dart';
import '../../../../utils/constants/sizes.dart';
import '../../widgets/appbar.dart';
import '../../widgets/sortable_products.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      appBar: StoreAppBar(
        showBackArrow: true,
        title: Text('Popular Products'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(StoreSizes.defaultSpace),
          child: SortableProducts(),
        ),
      ),
    );
  }
}

