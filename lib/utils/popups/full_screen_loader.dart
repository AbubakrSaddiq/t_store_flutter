import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/widgets/animation_loader.dart';
import '../constants/colors.dart';
import '../helpers/helper_functions.dart';


///A utility class for managing full screen loading dialog
class FullScreenLoader {
  // static void openLoadingDialog(String text, String animation) {
  //   showDialog(
  //       context: Get.overlayContext!, //use Get.overlayContext for overlay dialogs
  //       barrierDismissible: false, //dialog cant be dismissed by tapping outside it
  //       builder: (_) => PopScope(
  //           canPop: false, //disable popping with the back button
  //           child: Dialog(
  //             backgroundColor: Colors.transparent,
  //             elevation: 0,
  //             insetPadding: const EdgeInsets.all(0),
  //               child: Container(
  //                   alignment: Alignment.center,
  //                 color: StoreHelperFunction.isDarkMode(Get.context!)
  //                     ? StoreColors.dark
  //                     : StoreColors.white,
  //                 width: double.infinity,
  //                 height: double.infinity,
  //                 child: (
  //                     // SizedBox(height: 200,),
  //                     StoreAnimationLoaderWidget(text: text, animation: animation)
  //                 )
  //               ),
  //           )));
  // }
  static void openLoadingDialog(String text, String? animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Dialog(
          backgroundColor: Colors.black54,
          elevation: 0,
          insetPadding: const EdgeInsets.all(0),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(color: Colors.white),
                const SizedBox(height: 16),
                Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  
  ///stop the currently open loading dialog
  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop(); //close dialog using navigator
  }
}

