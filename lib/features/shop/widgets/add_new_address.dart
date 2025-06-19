// import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:store_app/features/shop/widgets/appbar.dart';
// import 'package:store_app/utils/constants/sizes.dart';
//
// class AddNewAddressScreen extends StatelessWidget {
//   const AddNewAddressScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const StoreAppBar(
//         showBackArrow: true,
//         title: Text('Add Address'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(StoreSizes.defaultSpace),
//           child: Form(
//             child: Column(
//               children: [
//
//                 ///house no and postal code
//                 Row(
//                   children: [
//                     Expanded(
//                       child: TextFormField(
//                         decoration: const InputDecoration(prefixIcon: Icon(Iconsax
//                             .house), labelText: 'House No'),
//                       ),
//                     ),
//                     const SizedBox(width: StoreSizes.spaceBtwItems / 2,),
//                     Expanded(
//                       child: TextFormField(
//                         decoration: const InputDecoration(prefixIcon: Icon(Iconsax
//                             .code4), labelText: 'Postal Code'),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: StoreSizes.spaceBtwInputFields,),
//
//                 ///street address
//                 TextFormField(
//                   decoration: const InputDecoration(
//                       prefixIcon: Icon(Iconsax.location), labelText: 'Street'),
//                 ),
//                 const SizedBox(height: StoreSizes.spaceBtwInputFields,),
//
//                 ///city and state dropdown
//                 Row(
//                   children: [
//                     Expanded(
//                   child: DropdownButtonFormField<String>(
//                   decoration: const InputDecoration(
//                   prefixIcon: Icon(Iconsax.building),
//                   labelText: 'City',
//                   border: OutlineInputBorder(),
//                   ),
//                   items: ['New York', 'London', 'Tokyo', 'Sydney']
//                       .map((city) => DropdownMenuItem(
//                   value: city,
//                   child: Text(city),
//                   ))
//                       .toList(),
//                   onChanged: (value) {
//                   // Handle selection change
//                   },
//                   validator: (value) {
//                   if (value == null || value.isEmpty) {
//                   return 'Please select a city';
//                   }
//                   return null;
//                   },
//                   ),
//                 ),
//                 const SizedBox(width: StoreSizes.spaceBtwItems / 2,),
//                     Expanded(
//                       child: DropdownButtonFormField<String>(
//                         decoration: const InputDecoration(
//                           prefixIcon: Icon(Iconsax.safe_home),
//                           labelText: 'State',
//                           border: OutlineInputBorder(),
//                         ),
//                         items: ['Abia', 'Adamawa', 'Bauchi', 'Gombe']
//                             .map((city) => DropdownMenuItem(
//                           value: city,
//                           child: Text(city),
//                         ))
//                             .toList(),
//                         onChanged: (value) {
//                           // Handle selection change
//                         },
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please select a state';
//                           }
//                           return null;
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: StoreSizes.spaceBtwInputFields,),
//                 SizedBox(width: double.infinity,
//                     child: ElevatedButton(
//                         onPressed: () {}, child: const Text('Save')))
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
// }
