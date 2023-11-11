import 'package:app/Features/main_page/presentation/manager/cubits/cubit/main_page_cubit.dart';
import 'package:app/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPageView extends StatelessWidget {
  const MainPageView({super.key});

  @override
  Widget build(BuildContext context) {
    MainPageCubit cubit = BlocProvider.of<MainPageCubit>(context);
    return BlocBuilder<MainPageCubit, MainPageStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Secure Shield'),
          ),
          body: cubit.views[cubit.currentView],
          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.transparent,
            buttonBackgroundColor: kCardColor,
            color: kCardColor,
            animationDuration: const Duration(milliseconds: 400),
            onTap: (value) => cubit.onViewChanges(value),
            items: [
              Icon(Icons.home),
              Icon(Icons.home),
              Icon(Icons.home),
              Icon(Icons.home),
            ],
          ),
        );
      },
    );
  }
}

//  IconButton(
//             onPressed: () async {
//               await FirebaseAuth.instance.signOut().then((value) {
//                 GoRouter.of(context).pushReplacement(AppRouter.signInViewPath);
//               });
//             },
//             icon: const Icon(Icons.logout_outlined),
//           )
