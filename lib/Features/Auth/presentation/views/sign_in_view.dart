import 'package:app/Features/Auth/presentation/widgets/sign_in_view_body.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: SignInViewBody(),
    );
  }
}
