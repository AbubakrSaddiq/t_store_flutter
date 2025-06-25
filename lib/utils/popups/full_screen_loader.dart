import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/widgets/animation_loader.dart';
import '../constants/colors.dart';
import '../helpers/helper_functions.dart';


///A utility class for managing full screen loading dialog
class FullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
        context: Get.overlayContext!, //use Get.overlayContext for overlay dialogs
        barrierDismissible: false, //dialog cant be dismissed by tapping outside it
        builder: (_) => PopScope(
            canPop: false, //disable popping with the back button
            child: Container(
              color: StoreHelperFunction.isDarkMode(Get.context!)
                  ? StoreColors.dark
                  : StoreColors.white,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                  ),
                  StoreAnimationLoaderWidget(text: text, animation: animation)
                ],
              ),
            )));
  }

  ///stop the currently open loading dialog
  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop(); //close dialog using navigator
  }
}

