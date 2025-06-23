import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:t_store/firebase_options.dart';

import 'app.dart';

Future<void> main() async {
  // Todo: Add widget binding
  // Todo: init local storage
  // Todo: Await native splash
  // Todo: init firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  // Todo: init auth

  runApp(const App(

  ));

}
