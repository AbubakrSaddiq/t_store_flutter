// import 'package:flutter/material.dart';
// import 'package:t_store/features/shop/widgets/product_price_tag.dart';
// import 'package:t_store/features/shop/widgets/rounded_container.dart';
// import 'package:t_store/features/shop/widgets/section_heading.dart';
// import 'package:t_store/features/shop/widgets/text/product_title_text.dart';
//
// import '../../../utils/constants/colors.dart';
// import '../../../utils/constants/sizes.dart';
// import '../../../utils/helpers/helper_functions.dart';
// import 'choice_chip.dart';
//
// class ProductAttributes extends StatelessWidget {
//   const ProductAttributes({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final dark = StoreHelperFunction.isDarkMode(context);
//     return Column(
//       children: [
//         ///selected attribute pricing and description
//         RoundedContainer(
//           padding: const EdgeInsets.all(StoreSizes.md),
//           backgroundColor: dark ? StoreColors.darkerGrey : StoreColors.grey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//             ///title, price and stock status
//               Row(
//                 children: [
//                   // SectionHeading(title: 'Variation', showActionButton: false,),
//                   Text(
//                     'Variation',
//                     style: Theme.of(context)
//                         .textTheme
//                         .headlineSmall,
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   const SizedBox(width: StoreSizes.spaceBtwItems,),
//                   Column(
//                     children: [
//                       Row(
//                         children: [
//                           // ProductTitleText(title: 'Price: ', smallSize: true,),
//                           Text(
//                             'Price: ',
//                             style: Theme.of(context).textTheme.labelLarge,
//                             overflow: TextOverflow.ellipsis,
//
//                           ),
//                           ///actual price
//                           Text('N20', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
//                           ///sale price
//                           const ProductPriceTag(price: '20'),
//                         ],
//                       ),
//                       ///stock
//                       Row(
//                         children: [
//                           const ProductTitleText(title: 'Stock: ', smallSize: true,),
//                           Text('In Stock', style: Theme.of(context).textTheme.titleMedium,)
//                         ],
//                       )
//                     ],
//                   )
//                 ],
//               ),
//               const ProductTitleText(title: 'This is the description of the product (4 line)', smallSize: true, maxLine: 4,)
//             ],
//           ),
//         ),
//         const SizedBox(height: StoreSizes.spaceBtwItems,),
//         ///attributes
//         ///colors attribute
//          Column(
//           children: [
//             const SectionHeading(title: 'Colors', showActionButton: false,),
//             const SizedBox(height: StoreSizes.spaceBtwItems / 2,),
//             Wrap(
//               spacing: 8,
//               children: [
//                 StoreChoiceChip(text: 'Blue', selected: true, onSelected: (value){},),
//                 StoreChoiceChip(text: 'Teal', selected: false, onSelected: (value){},),
//                 StoreChoiceChip(text: 'Red', selected: false, onSelected: (value){},),
//                 StoreChoiceChip(text: 'Blue', selected: true, onSelected: (value){},),
//                 StoreChoiceChip(text: 'Teal', selected: false, onSelected: (value){},),
//                 StoreChoiceChip(text: 'Red', selected: false, onSelected: (value){},),
//                 StoreChoiceChip(text: 'Blue', selected: true, onSelected: (value){},),
//                 StoreChoiceChip(text: 'Teal', selected: false, onSelected: (value){},),
//                 StoreChoiceChip(text: 'Red', selected: false, onSelected: (value){},),
//               ],
//             )
//
//
//           ],
//         ),
//         ///sizes attribute
//          Column(
//            crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SectionHeading(title: 'Size', showActionButton: false,),
//             const SizedBox(height: StoreSizes.spaceBtwItems / 2,),
//             Wrap(
//               spacing: 8,
//               children: [
//                 StoreChoiceChip(text: 'NG 38', selected: true, onSelected: (value){}),
//                 StoreChoiceChip(text: 'NG 39', selected: false, onSelected: (value){}),
//                 StoreChoiceChip(text: 'NG 40', selected: false, onSelected: (value){}),
//
//               ],
//             )
//
//
//           ],
//         ),
//
//       ],
//     );
//   }
// }
//
