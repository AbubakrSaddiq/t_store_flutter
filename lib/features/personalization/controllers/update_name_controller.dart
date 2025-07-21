import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/features/personalization/screens/profile/profile.dart';

import '../../../utils/connection/network_manager.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';

class updateNameController extends GetxController{
  static updateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();

  final userController = UserController.instance;
  final userRepo = Get.put(UserRepository());

  GlobalKey<FormState> updateUsernameFormKey = GlobalKey<FormState>();

  ///init user data when home screen appears
  @override
  void onInit() {
    super.onInit();
    initializeNames();
  }

  ///fetch user record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  ///update username
  Future<void> updateUserName() async {
    try {
      //start loading
      FullScreenLoader.openLoadingDialog(
        'Updating...',
        StoreImages.loginLoading,
      );

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // remove loader
        FullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if (!updateUsernameFormKey.currentState!.validate()) {
        // remove loader
        FullScreenLoader.stopLoading();
        return;
      }

    //   update user first name and last name in the firebase
      Map<String, dynamic> name = {'FirstName': firstName.text.trim(), 'LastName': lastName.text.trim()};
      await userRepo.updateSingleField(name);

    //   update the Rx user value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

    //   remove loader
      FullScreenLoader.stopLoading();
      // success message
      StoreLoaders.successSnackBar(title: 'Success', message: 'Updated Name');

    //   move to previous screen
      Get.offAll(() => const ProfileScreen());
    } catch (e) {
      StoreLoaders.warningSnackBar(title: 'Data not save',
          message: 'Something went wrong. You can retry saving in your Profile');
    }
  }

}