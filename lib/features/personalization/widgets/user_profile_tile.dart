import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key, required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return ListTile(
      // leading: CircleAvatar(image: StoreImages.user, width: 50, height: 50, padding: 0,),
      leading: CircleAvatar(backgroundImage: AssetImage(StoreImages.review),),
      title: Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall?.apply(color: StoreColors.white),),
      subtitle: Text(controller.user.value.email, style: Theme.of(context).textTheme.bodyMedium?.apply(color: StoreColors.white),),
      trailing: IconButton(onPressed: onPressed, icon: const Icon(Iconsax.edit, color: StoreColors.white,),),
    );
  }
}


