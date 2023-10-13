import 'package:app/Features/Auth/presentation/widgets/sign_in_view_body.dart';
import 'package:app/core/constants/constants.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(gradient: kGradientColor),
        child: const SignInViewBody(),
      ),
    );
  }
}
