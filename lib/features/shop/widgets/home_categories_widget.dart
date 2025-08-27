import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/personalization/widgets/category_shimmer.dart';
import 'package:t_store/features/shop/controllers/category_controller.dart';
import 'package:t_store/features/shop/screens/sub_category/sub_category.dart';
import 'package:t_store/features/shop/widgets/vertical_image_text.dart';

import '../../../../utils/constants/image_strings.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
   final categoryController = Get.put(CategoryController());

    return Obx(() {
      if(categoryController.isLoading.value) return const StoreCategoryShimmer();

      if(categoryController.featuredCategories.isEmpty){
        return Center(child: Text('No Data Found', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),),);
      }
      return SizedBox(
        height: 110,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: categoryController.featuredCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final category = categoryController.featuredCategories[index];
            return VerticalImageText(
              image: category.image,
              title: category.name,
              onTap: () => Get.to(() => SubCategoryScreen()),
            );
          },
        ),
      );
    });
    

  }
}
