// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../utils/constants/colors.dart';
// import '../../../utils/constants/sizes.dart';
// import '../screens/home/home_controller.dart';
// import 'PromoImage.dart';
// import 'circular_container.dart';
//
// class PromoSlider extends StatelessWidget {
//   const PromoSlider({
//     super.key, required this.banners,
//   });
//
//   final List<String> banners;
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(HomeController());
//
//     return Column(
//       children: [
//         CarouselSlider(
//           items: banners.map((url) => PromoImage(imageUrl: url)).toList(),
//           options: CarouselOptions(viewportFraction: 1,onPageChanged: (index, _) => controller.updatePageIndicator(index)),
//         ),
//         const SizedBox(
//           height: StoreSizes.spaceBtwItems,
//         ),
//         ///promo indicator
//         Obx(
//           () => Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               for (int i = 0; i < banners.length; i++)
//                 CircularContainer(
//                   width: 20,
//                   height: 4,
//                   margin: const EdgeInsets.only(right: 10),
//                   backgroundColor: controller.carousalCurrentIndex.value == i ? StoreColors.primary : Colors.grey,
//                 ),
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }
