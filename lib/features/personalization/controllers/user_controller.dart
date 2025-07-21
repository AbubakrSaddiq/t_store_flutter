import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/data/repositories/user/user_model.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';
import 'package:t_store/features/personalization/screens/profile/re_auth_user_login_form.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/popups/loaders.dart';

import '../../../utils/constants/image_strings.dart';
import '../../../utils/popups/full_screen_loader.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());

  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepo = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  ///fetch user record
  Future<void> fetchUserRecord() async {
    try{
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    }catch (e){
      user(UserModel.empty());
    }finally{
      profileLoading.value = false;
    }
  }

  ///save user record from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        //   convert names to first name and last name
        final nameParts = UserModel.nameParts(
            userCredentials.user!.displayName ?? '');
        final username = UserModel.generateUserName(
            userCredentials.user!.displayName ?? '');

        //   map data
        final user = UserModel(id: userCredentials.user!.uid,
            username: username,
            email: userCredentials.user!.email ?? '',
            firstName: nameParts[0],
            lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            profilePicture: userCredentials.user!.phoneNumber ?? '');

      //   save user data
        await userRepository.createUser(user);
      }
    } catch (e) {
      StoreLoaders.warningSnackBar(title: 'Data not save',
          message: 'Something went wrong. You can retry saving in your Profile');
    }
  }

  ///delete account warning
  void deleteAccountWarningPopup(){
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(StoreSizes.md),
      title: 'Delete Account',
      middleText: 'Are you sure you want to delete your account permanently?',
      confirm: OutlinedButton(onPressed: () async => deleteUserAccount(),
          style: OutlinedButton.styleFrom(backgroundColor: Colors.red,),
          child: const Padding(padding: EdgeInsets.symmetric(horizontal: StoreSizes.lg), child: Text('Delete'),)
      ),
      cancel: OutlinedButton(onPressed: () => Navigator.of(Get.overlayContext!).pop(), child: const Text('Cancel'))
    );
  }

  ///delete user account
  Future<void> deleteUserAccount() async {
    try{
      //start loading
      FullScreenLoader.openLoadingDialog('Processing request...', StoreImages.loginLoading,);

      ///first re-authenticate user
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e) => e.providerId).first;
      if(provider.isNotEmpty){
      //   re verify auth email
        if(provider == 'google.com'){
          await auth.signInWithGoogle();
          await auth.deleteAccount();

          FullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        }else if(provider == 'password'){
          FullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForms());
        }

      }
    } catch (e) {
      FullScreenLoader.stopLoading();
      StoreLoaders.errorSnackBar(title: 'Failed to delete', message: e.toString());
    }
  }
///re-authenticate before deleting
  void reAuthenticateEmailAndPassword(){

  }
}