import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/authentication/screens/signup/verify_email.dart';
import 'package:t_store/features/shop/widgets/navigation_menu.dart';
import '../../../features/authentication/screens/login/login.dart';
import '../../../features/authentication/screens/onboarding/onboarding.dart';
import '../../../utils/exception/firebase_auth_exception.dart';
import '../../../utils/exception/firebase_exception.dart';
import '../../../utils/exception/format_exception.dart';
import '../../../utils/exception/platform_exception.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  ///variable
  final deviceStorage = GetStorage();

  final _auth = FirebaseAuth.instance;

  ///get authenticated user
  User? get authUser => _auth.currentUser;

  ///called from main.dart on app lunch
  @override
  void onReady() {
    FlutterNativeSplash.remove(); //remove native splash screen
    screenRedirect(); //redirect to appropriate screen
  }

  ///function to show relevant screen
  void screenRedirect() {
    final user = _auth.currentUser;
    //check if user email is verified or not
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email,));
      }
    } else {
      //  local storage
      deviceStorage.writeIfNull('isFirstTime', true);
      //check if user is a first timer
      deviceStorage.read('isFirstTime') != true
          ? Get
          .offAll(() => const LoginScreen()) //redirect to login screen if not first time
          : Get
          .offAll(() => const OnBoardingScreen()); //redirect to onboarding screen if first time
    }
  }

  /*email and password sign in*/

  ///EmailAuthentication - Login
  loginWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw StoreFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw StoreFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw StoreFormatException();
    } on PlatformException catch (e) {
      throw StorePlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again...';
    }
  }

  ///EmailAuthentication - register
  Future<UserCredential> registerWithEmailAndPassword(String email, String password,) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw StoreFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw StoreFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw StoreFormatException();
    } on PlatformException catch (e) {
      throw StorePlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again...';
    }
  }

  ///ReAuthenticate - ReAuth user
  Future<void> reAuthenticateWithEmailAndPassword(String email, String password) async {
    try {
      //create a credential
      AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);

    //   re-authenticate
      await _auth.currentUser!.reauthenticateWithCredential(credential);

    } on FirebaseAuthException catch (e) {
      throw StoreFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw StoreFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw StoreFormatException();
    } on PlatformException catch (e) {
      throw StorePlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again...';
    }
  }

  ///emailVerification - mail verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw StoreFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw StoreFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw StoreFormatException();
    } on PlatformException catch (e) {
      throw StorePlatformException(e.code).message;
    }
    catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  ///EmailAuthentication - forget password
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw StoreFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw StoreFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw StoreFormatException();
    } on PlatformException catch (e) {
      throw StorePlatformException(e.code).message;
    }
    catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }
  /*federated identity and social sign in*/

  ///GoogleAuth - Google
  Future<UserCredential?> signInWithGoogle() async {
    try {
      //   trigger the authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
      //   obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await userAccount
          ?.authentication;
      //   create a new credential
      final credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      //   once signed in, return the UserCredentials
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw StoreFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw StoreFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw StoreFormatException();
    } on PlatformException catch (e) {
      throw StorePlatformException(e.code).message;
    }
    catch (e) {
      if (kDebugMode) print('Something went wrong: $e');
      return null;
    }
  }

  ///FacebookAuth - Facebook

  ///LogoutUser - valid for any authentication
  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw StoreFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw StoreFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw StoreFormatException();
    } on PlatformException catch (e) {
      throw StorePlatformException(e.code).message;
    }
    catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

///DeleteUser - remove user Auth and firebase account
  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      throw StoreFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw StoreFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw StoreFormatException();
    } on PlatformException catch (e) {
      throw StorePlatformException(e.code).message;
    }
    catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }
}
