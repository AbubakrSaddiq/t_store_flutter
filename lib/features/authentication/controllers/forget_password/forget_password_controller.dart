import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/features/authentication/screens/forget%20config/reset_password.dart';
import 'package:t_store/utils/popups/loaders.dart';

import '../../../../utils/connection/network_manager.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/popups/full_screen_loader.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  ///variable
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  ///send reset password email
  sendPasswordRestEmail() async {
    try {
      //start loading
      FullScreenLoader.openLoadingDialog(
        'Resetting password...',
        StoreImages.loginLoading,
      );

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // remove loader
        FullScreenLoader.stopLoading();
        return;
      }

      //   form validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      //   send email to reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(
        email.text.trim(),
      );

      // remove loader
      FullScreenLoader.stopLoading();

    //   show success screen
      StoreLoaders.successSnackBar(title: 'Email Link Sent');

    //   redirect
      Get.to(() => ResetPassword(email: email.text.trim()));
    } catch (e) {
      FullScreenLoader.stopLoading();
      StoreLoaders.errorSnackBar(title: 'Reset Password Failed', message: e.toString());
    }
  }

  resendPasswordRestEmail(String email) async {
    try {
      //start loading
      FullScreenLoader.openLoadingDialog(
        'Resetting password...',
        StoreImages.loginLoading,
      );

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // remove loader
        FullScreenLoader.stopLoading();
        return;
      }
      //   send email to reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email,);

      // remove loader
      FullScreenLoader.stopLoading();

      //   show success screen
      StoreLoaders.successSnackBar(title: 'Email Link Sent');

    } catch (e) {
      FullScreenLoader.stopLoading();
      StoreLoaders.errorSnackBar(title: 'Reset Password Failed', message: e.toString());
    }
  }
}
