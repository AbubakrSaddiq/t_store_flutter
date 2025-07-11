import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';

import '../../../../utils/connection/network_manager.dart';
import '../../../../utils/popups/loaders.dart';

class LoginController extends GetxController{
  ///variables
  final rememberMe = false.obs;
  final hideShowPassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();


  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL'); //to remember email
    password.text = localStorage.read('REMEMBER_ME_PASSWORD'); //remember password
  }

  Future<void> emailAndPasswordSignIn() async {
    try{
      //start loading
      FullScreenLoader.openLoadingDialog('Logging in...', StoreImages.loginLoading);

      /// check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected){
        // remove loader
        FullScreenLoader.stopLoading();
        return;}

      ///form validation
      if (!loginFormKey.currentState!.validate()) {
        // Form is valid
        print('Email: ${email.text}');
        print('Password: ${password.text}');

        // remove loader
        FullScreenLoader.stopLoading();
        return;
      }

      //save data if Remember Me is selected
      if(rememberMe.value){
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

    //   login user using email and password authentication
      final userCredentials = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

    //   remove loader
      FullScreenLoader.stopLoading();

    //   redirect
      AuthenticationRepository.instance.screenRedirect();
    }catch (e, st) {
      FullScreenLoader.stopLoading();
      debugPrint('Login error: $e\n$st');
      StoreLoaders.errorSnackBar(
        title: 'Login Failed',
        message: e.toString(),
      );
    }
  }
}