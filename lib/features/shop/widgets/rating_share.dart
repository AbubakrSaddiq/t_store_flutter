import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/sizes.dart';

class RatingAndShare extends StatelessWidget {
  const RatingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ///ratings
        Row(
          children: [
            const Icon(Iconsax.star5, color: Colors.amberAccent, size: 24,),
            const SizedBox(width: StoreSizes.spaceBtwItems,),
            Text.rich(TextSpan(
                children: [
                  TextSpan(text: '4.9', style: Theme.of(context).textTheme.bodyLarge),
                  const TextSpan(text: '(344)'),
                ]
            ))
          ],
        ),
        ///share
        IconButton(onPressed: (){}, icon: const Icon(Icons.share, size: StoreSizes.iconMd,))
      ],
    );
  }
}
