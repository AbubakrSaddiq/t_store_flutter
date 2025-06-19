// import 'package:flutter/material.dart';
// import 'package:store_app/features/shop/widgets/appbar.dart';
// import 'package:store_app/features/shop/widgets/start_rating.dart';
// import 'package:store_app/features/shop/widgets/user_review_card.dart';
// import 'package:store_app/utils/constants/sizes.dart';
// import 'overall_progress_indicator.dart';
//
// class ProductReviewScreen extends StatelessWidget {
//   const ProductReviewScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       ///Appbar
//       appBar: const StoreAppBar(
//         title: Text('Reviews & Ratings'),
//         showBackArrow: true,
//       ),
//
//       ///body
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(StoreSizes.defaultSpace),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text('Rating and reviews are verified...blah blah'),
//               const SizedBox(
//                 height: StoreSizes.spaceBtwItems,
//               ),
//
//               ///overall product rating
//               const OverallProductRating(),
//
//               ///star ratings
//               const StarRatingBarIndicator(rating: 4.5,),
//               Text('2,912', style: Theme.of(context).textTheme.bodySmall,),
//               const SizedBox(height: StoreSizes.spaceBtwSections,),
//
//               ///user reviews
//               const UserReviewCard(),
//               const UserReviewCard(),
//               const UserReviewCard(),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
