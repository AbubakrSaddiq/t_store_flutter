import 'package:flutter/material.dart';
import 'package:t_store/features/authentication/screens/login/widgets/login_form.dart';

import '../../../../common/styles/spacing_styles.dart';



class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: StoreSpacingStyle.paddingWithAppBarHeight,

          ///logo, title, sub title, login form
          child: LoginForm(),
        ),
      ),
    );
  }
}

