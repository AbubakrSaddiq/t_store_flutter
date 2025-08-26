import 'package:flutter/material.dart';
import 'package:t_store/features/personalization/widgets/StoreShimmer.dart';
import 'package:t_store/utils/constants/sizes.dart';

class StoreCategoryShimmer extends StatelessWidget {
  const StoreCategoryShimmer({super.key,
  this.itemCount = 6
  });

  final int itemCount;
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => const SizedBox(width: StoreSizes.spaceBtwItems,),
        itemCount: itemCount,
        itemBuilder: (_, __){
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///image
              StoreShimmer(width: 55, height: 55, radius: 55,),
              SizedBox(height: StoreSizes.spaceBtwItems / 2,),
              
              ///text
              StoreShimmer(width: 55, height: 8)
            ],
          );
        },
      ),
    );
  }
}
