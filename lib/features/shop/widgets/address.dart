// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:store_app/features/shop/widgets/add_new_address.dart';
// import 'package:store_app/features/shop/widgets/appbar.dart';
// import 'package:store_app/features/shop/widgets/single_address.dart';
// import 'package:store_app/utils/constants/colors.dart';
// import 'package:store_app/utils/constants/sizes.dart';
//
// class UserAddressScreen extends StatelessWidget {
//   const UserAddressScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: StoreAppBar(
//         showBackArrow: true,
//         title: Text('Address', style: Theme.of(context).textTheme.headlineSmall,),
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: StoreColors.primary,
//         onPressed: () => Get.to(() => const AddNewAddressScreen()) ,
//         child: const Icon(Iconsax.add, color: StoreColors.white,),
//       ),
//       body: const SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(StoreSizes.defaultSpace),
//           child: Column(
//             children: [
//               SingleAddress(selectedAddress: true),
//               SingleAddress(selectedAddress: false),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
