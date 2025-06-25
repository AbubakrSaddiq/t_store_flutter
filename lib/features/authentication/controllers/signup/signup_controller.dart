import 'package:flutter/cupertino.dart';
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

  ///signup
  void signup() async {
    try {
      //  start loading
      FullScreenLoader.openLoadingDialog(
          'Processing your request', StoreImages.dotsLoading);

      //  check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      //  form validation
      if (!signupFormKey.currentState!.validate()) return;

      //  privacy policy check
      if (!privacyPolicy.value) {
        StoreLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message: 'You must read and accept privacy policy terms');
        return;
      }

      //  register user in the firebase auth and save user data in the firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      //  save auth user data in the firebase
      final newUser = UserModel(
          id: userCredential.user!.uid,
          username: username.text.trim(),
          email: email.text.trim(),
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '');

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // remove loader
      FullScreenLoader.stopLoading();

      //  show success message
      StoreLoaders.successSnackBar(title: 'Congratulations', message: 'Your account has been created. Verify email to continue');

      //  goto to verify email screen
      Get.to(() => VerifyEmailScreen());
    } catch (e) {
      //  show error message
      StoreLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
    // finally{
    //   // remove loader
    //   FullScreenLoader.stopLoading();
    // }
  }
}
