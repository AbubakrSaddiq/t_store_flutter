import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/widgets/vertical_image_text.dart';

import '../../../../utils/constants/image_strings.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"image": StoreImages.jewelryIcon, "title": "Jewelry"},
      {"image": StoreImages.deviceIcon, "title": "Devices"},
      {"image": StoreImages.toyIcon, "title": "Toy"},
      {"image": StoreImages.appliancesIcon, "title": "Appliances"},
      {"image": StoreImages.clothesIcon, "title": "Clothes"},
      {"image": StoreImages.sportswearIcon, "title": "Sportswear"},
    ];
    return Padding(
      padding: const EdgeInsets.only(left: 18.0),
      child: SizedBox(
        height: 110,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 6,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return VerticalImageText(
              image: categories[index]["image"],
              onTap: (){},
              title: categories[index]["title"],
            );
          },
        ),
      ),
    );
  }
}
