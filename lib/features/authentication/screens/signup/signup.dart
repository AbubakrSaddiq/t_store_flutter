import 'package:flutter/material.dart';
import 'package:t_store/features/authentication/screens/signup/widgets/signup_form.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/texts.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //value for light and dark mode
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(StoreSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///title
              Text(
                StoreTexts.signUpTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: StoreSizes.spaceBtwSections,
              ),

              ///form
              const SignUpForm()
            ],
          ),
        ),
      ),
    );
  }
}

