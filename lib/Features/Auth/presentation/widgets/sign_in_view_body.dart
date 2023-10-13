import 'package:app/Features/Auth/presentation/widgets/sign_in_form.dart';
import 'package:flutter/material.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(flex: 3),

          // sign in title
          const Text(
            'Sign in',
            style: TextStyle(
              fontSize: 34,
              color: Colors.white,
            ),
          ),
          Text(
            'Please sign in to continue.',
            style: TextStyle(
              color: Colors.white.withOpacity(0.6),
            ),
          ),
          const SizedBox(height: 26.0),

          // email field, password field ,sign in button
          const SignInForm(),

          const Spacer(flex: 4),
        ],
      ),
    );
  }
}
