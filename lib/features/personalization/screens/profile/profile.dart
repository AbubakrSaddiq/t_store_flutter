import 'package:flutter/material.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../shop/widgets/appbar.dart';
import '../../../shop/widgets/circular_image.dart';
import '../../../shop/widgets/section_heading.dart';
import '../../widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StoreAppBar(title: Text('Profile'), showBackArrow: true,),
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
                    CircularImage(image: StoreImages.user, width: 80, height: 80,),
                    TextButton(onPressed: (){}, child: const Text('Change Profile Picture'))
                  ],
                ),
              ),
              const SizedBox(height: StoreSizes.spaceBtwItems / 2,),
              const Divider(),
              const SizedBox(height: StoreSizes.spaceBtwItems,),
              ///details
              ///profile info details
              const SectionHeading(title: 'Profile Info', showActionButton: false,),
              const SizedBox(height: StoreSizes.spaceBtwItems,),
              ProfileMenu(onPressed: () {  }, title: 'Name', value: 'Aizen Soske',),
              ProfileMenu(onPressed: () {  }, title: 'Username', value: 'Aizen Soske',),
              const Divider(),
              const SizedBox(height: StoreSizes.spaceBtwItems / 2,),
              ///personal info
              const SectionHeading(title: 'Personal Info', showActionButton: false,),
              const SizedBox(height: StoreSizes.spaceBtwItems / 2,),
              ProfileMenu(onPressed: () {  }, title: 'User ID', value: '43325',),
              ProfileMenu(onPressed: () {  }, title: 'E-mail', value: 'Aizensoske@yahoo.com',),
              ProfileMenu(onPressed: () {  }, title: 'Phone Number', value: '+234 708 097 7653',),
              ProfileMenu(onPressed: () {  }, title: 'Gender', value: 'Male',),
              ProfileMenu(onPressed: () {  }, title: 'Date of Birth', value: '11 Jun, 1980',),
              const Divider(),
              const SizedBox(height: StoreSizes.spaceBtwItems,),
              Center(
                child: TextButton(
                  onPressed: () {  },
                  child: const Text('Close Account', style: TextStyle(color: Colors.red),),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}

