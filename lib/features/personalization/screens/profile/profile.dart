import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:t_store/features/personalization/screens/profile/change_name.dart';
import 'package:t_store/features/personalization/widgets/StoreShimmer.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../shop/widgets/appbar.dart';
import '../../../shop/widgets/circular_image.dart';
import '../../../shop/widgets/section_heading.dart';
import '../../controllers/user_controller.dart';
import '../../widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Scaffold(
      appBar: const StoreAppBar(title: Text('Profile'), showBackArrow: true),

      ///body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(StoreSizes.defaultSpace),
          child: Column(
            children: [
              ///profile picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty
                          ? networkImage
                          : StoreImages.user;
                      return controller.imageUploading.value
                          ? const StoreShimmer(
                              width: 80,
                              height: 80,
                              radius: 80,
                            )
                          : CircularImage(
                              image: image,
                              width: 80,
                              height: 80,
                              isNetworkImage: networkImage.isNotEmpty,
                            );
                    }),
                    TextButton(
                      onPressed: () => controller.uploadUserProfilePicture(),
                      child: const Text('Change Profile Picture'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: StoreSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: StoreSizes.spaceBtwItems),

              ///details
              ///profile info details
              const SectionHeading(
                title: 'Profile Info',
                showActionButton: false,
              ),
              const SizedBox(height: StoreSizes.spaceBtwItems),
              ProfileMenu(
                onPressed: () => Get.to(() => const ChangeName()),
                title: 'Name',
                value: controller.user.value.fullName,
              ),
              ProfileMenu(
                onPressed: () {},
                title: 'Username',
                value: controller.user.value.username,
              ),
              const Divider(),
              const SizedBox(height: StoreSizes.spaceBtwItems / 2),

              ///personal info
              const SectionHeading(
                title: 'Personal Info',
                showActionButton: false,
              ),
              const SizedBox(height: StoreSizes.spaceBtwItems / 2),
              ProfileMenu(
                onPressed: () {},
                title: 'User ID',
                value: controller.user.value.id,
              ),
              ProfileMenu(
                onPressed: () {},
                title: 'E-mail',
                value: controller.user.value.email,
              ),
              ProfileMenu(
                onPressed: () {},
                title: 'Phone Number',
                value: controller.user.value.phoneNumber,
              ),
              ProfileMenu(onPressed: () {}, title: 'Gender', value: 'Male'),
              ProfileMenu(
                onPressed: () {},
                title: 'Date of Birth',
                value: '11 Jun, 1980',
              ),
              const Divider(),
              const SizedBox(height: StoreSizes.spaceBtwItems),
              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text(
                    'Close Account',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
