import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../data/repositories/user/user_model.dart';
import '../../../../data/repositories/user/user_repository.dart';
import '../../../../utils/connection/network_manager.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';
import '../../screens/signup/verify_email.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  ///variable
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(); //form key validation
  final hideShowPassword = true.obs; //observable for hiding/showing password
  final privacyPolicy = true.obs; //observable for privacy policy

  final userRepository = Get.put(UserRepository());

  ///signup
  void signup() async {
    try {
      // Start loading (its not showing the required, check)
      FullScreenLoader.openLoadingDialog(
        'Processing your request. Please wait...',
        StoreImages.dotsLoading,
      );

      /// check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected){
        // remove loader
        FullScreenLoader.stopLoading();
        return;}

      ///form validation
      if (signupFormKey.currentState!.validate()) {
        // Form is valid
        print('First Name: ${firstName.text}');
        print('Last Name: ${lastName.text}');
        print('Username: ${username.text}');
        print('Email: ${email.text}');
        print('Phone: ${phoneNumber.text}');
        print('Password: ${password.text}');
        StoreLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your account has been created. Verify email to continue',
        );
        // remove loader
        FullScreenLoader.stopLoading();
        return;
      }

      /// privacy policy check
      if (!privacyPolicy.value) {
        StoreLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message: 'You must read and accept privacy policy terms',
        );
        return;
      }

      /// Register user(only email and password) in the firebase auth and save user data in the firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
            email.text.trim(),
            password.text.trim(),
          );

      /// Save auth user data(all user data) in the firebase
      final newUser = UserModel(
        id: userCredential.user!.uid,
        username: username.text.trim(),
        email: email.text.trim(),
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      await userRepository.createUser(newUser);

      // remove loader
      FullScreenLoader.stopLoading();

      //  show success message
      StoreLoaders.successSnackBar(
        title: 'Congratulations',
        message: 'Your account has been created. Verify email to continue',
      );

      // goto to verify email screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim(),));

    } catch (e) {
      // remove loader
      FullScreenLoader.stopLoading();
      // show some generic error
      StoreLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
