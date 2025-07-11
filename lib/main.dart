import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/firebase_options.dart';

import 'app.dart';
import 'data/repositories/authentication/authentication_repository.dart';

Future<void> main() async {
  /// widget binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  /// GetX local storage
  await GetStorage.init();

  /// Await native splash until other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// init firebase and authentication repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,).then(
      (FirebaseApp value) => Get.put(AuthenticationRepository())
  );

  // Todo: init auth

  runApp(const App(

  ));

}
