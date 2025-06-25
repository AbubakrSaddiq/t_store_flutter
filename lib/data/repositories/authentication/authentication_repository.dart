import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../features/authentication/screens/login/login.dart';
import '../../../features/authentication/screens/onboarding/onboarding.dart';
import '../../../utils/exception/firebase_exception.dart';
import '../../../utils/exception/format_exception.dart';
import '../../../utils/exception/platform_exception.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  ///variable
  final deviceStorage = GetStorage();

  final _auth = FirebaseAuth.instance;

  ///called from main.dart on app lunch
  @override
  void onReady() {
    FlutterNativeSplash.remove(); //remove native splash screen
    screenRedirect(); //redirect to appropriate screen
  }

  ///function to show relevant screen
  void screenRedirect() {
    //  local storage
    deviceStorage.writeIfNull('isFirstTime', true);
    ///check if user is a first timer
    deviceStorage.read('isFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const OnBoardingScreen());
  }

  //email and password sign in

  ///EmailAuthentication - sign in
  ///EmailAuthentication - register
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async{
    try{
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseException catch (e){
      throw StoreFirebaseException(e.code).message;
    }on FormatException catch (_){
      throw StoreFormatException();
    } on PlatformException catch (e){
      throw StorePlatformException(e.code).message;
    }
    catch (e){
      throw 'Something went wrong. Please try again...';
    }
  }

  ///ReAuthenticate - ReAuth user
  ///emailVerification - mail verification
  ///EmailAuthentication - forget password

  //federated identity and social sign in
  ///GoogleAuth - Google
  ///FacebookAuth - Facebook

  ///LogoutUser - valid for any authentication
  ///DeleteUser - remove user Auth and firebase account
}
