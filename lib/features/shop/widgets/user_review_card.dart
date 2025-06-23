import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:t_store/features/shop/widgets/rounded_container.dart';
import 'package:t_store/features/shop/widgets/start_rating.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = StoreHelperFunction.isDarkMode(context);
    return Column(
      children: [
        ///user image, name, settings
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(StoreImages.review),
                ),
                const SizedBox(
                  width: StoreSizes.spaceBtwItems,
                ),
                Text(
                  'Bello Mudi',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),
        const SizedBox(
          height: StoreSizes.spaceBtwItems,
        ),

        ///user review
        Row(
          children: [
            const StarRatingBarIndicator(
              rating: 2.5,
            ),
            const SizedBox(
              width: StoreSizes.spaceBtwItems,
            ),
            Text(
              '12/02/2025',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(
          height: StoreSizes.spaceBtwItems,
        ),
        ReadMoreText(
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley'
              ' of type and scrambled it to make a type specimen book. '
              'It has survived not only five centuries, but also the leap into electronic typesetting, '
              'remaining essentially unchanged. It was popularised in the 1960s with the release of '
              'Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing '
              'software like Aldus PageMaker including versions of Lorem Ipsum.',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimCollapsedText: ' show more',
          trimExpandedText: ' show less',
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: StoreColors.primary),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: StoreColors.primary),

        ),
        const SizedBox(height: StoreSizes.spaceBtwItems,),
      ///company review response
        RoundedContainer(
          backgroundColor: dark ? StoreColors.darkerGrey : StoreColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(StoreSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Customer Care',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      '13/02/2025',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(height: StoreSizes.spaceBtwItems,),
                ReadMoreText(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley'
                      ' of type and scrambled it to make a type specimen book. '
                      'It has survived not only five centuries, but also the leap into electronic typesetting, '
                      'remaining essentially unchanged. It was popularised in the 1960s with the release of '
                      'Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing '
                      'software like Aldus PageMaker including versions of Lorem Ipsum.',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: ' show more',
                  trimExpandedText: ' show less',
                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: StoreColors.primary),
                  lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: StoreColors.primary),

                ),

              ],
            ),
          ),
        ),
        const SizedBox(height: StoreSizes.spaceBtwSections,)
      ],
    );
  }
}
