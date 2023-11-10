import 'package:app/Features/home/presentation/widgets/home_view_body.dart';
import 'package:app/core/utils/app_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('The App'),
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut().then((value) {
                GoRouter.of(context).pushReplacement(AppRouter.signInViewPath);
              });
            },
            icon: const Icon(Icons.logout_outlined),
          )
        ],
      ),
      body: const HomeViewBody(),
    );
  }
}
