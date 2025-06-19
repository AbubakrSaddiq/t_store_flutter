// import 'package:flutter/material.dart';
// import 'package:store_app/features/shop/widgets/rounded_container.dart';
// import 'package:store_app/features/shop/widgets/texts/brand_text_with_verified_icon.dart';
// import 'package:store_app/utils/helpers/helper_functions.dart';
// import '../../../utils/constants/colors.dart';
// import '../../../utils/constants/enum.dart';
// import '../../../utils/constants/image_strings.dart';
// import '../../../utils/constants/sizes.dart';
// import 'circular_image.dart';
//
// class BrandCard extends StatelessWidget {
//   const BrandCard({
//     super.key,
//     required this.showBorder,
//     this.onTap,
//   });
//
//   final bool showBorder;
//   final void Function()? onTap;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: RoundedContainer(
//         padding: const EdgeInsets.all(StoreSizes.sm),
//         showBorder: showBorder,
//         backgroundColor: Colors.transparent,
//         child: Row(
//           ///icon
//           children: [
//             Flexible(
//               child: CircularImage(
//                 image: StoreImages.computerIcon,
//                 isNetworkImage: false,
//                 backgroundColor: Colors.transparent,
//                 overlayColor: StoreHelperFunction.isDarkMode(context) ? StoreColors.white : StoreColors.black,
//               ),
//             ),
//             const SizedBox(
//               height: StoreSizes.spaceBtwItems / 1.5,
//             ),
//             Expanded(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   ///title text
//                   const BrandTextWithVerifiedIcon(
//                     title: 'NASENI',
//                     brandTextSize: TextSizes.medium,
//                   ),
//
//                   ///subtitle text
//                   Text(
//                     '403 Products',
//                     overflow: TextOverflow.ellipsis,
//                     style: Theme.of(context).textTheme.labelMedium,
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
