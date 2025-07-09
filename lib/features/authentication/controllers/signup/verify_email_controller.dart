import 'package:get/get.dart';
import 'package:t_store/utils/popups/loaders.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  ///send email whenever verify screen appears and set timer for auto redirect
  @override
  void onInit() {
    super.onInit();
    sendEmailVerification();
  }

  ///send email verification link
  sendEmailVerification() async {
    try{
      await AuthenticationRepository.instance.sendEmailVerification();
      StoreLoaders.successSnackBar(title: 'Email Sent', message: 'Please check your inbox and verify your email');
    }catch (e){
      StoreLoaders.errorSnackBar(title: 'Oh Snapp', message: e.toString());

    }
  }
}
