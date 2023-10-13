import 'package:app/core/widgets/default_button.dart';
import 'package:app/core/widgets/default_text_field.dart';
import 'package:flutter/material.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
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
            const DefaultTextField(
              hintText: 'Email',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 12.0),
            DefaultTextField(
              hintText: 'Password',
              isHiddenPassword: true,
              suffix: Padding(
                padding: const EdgeInsetsDirectional.only(end: 8.0),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.visibility_off,
                    size: 22.0,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text('Forgot password?'),
              ),
            ),
            const SizedBox(height: 16.0),
            DefaultButton(
              onPressed: () {},
              btnText: 'Sign In',
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
