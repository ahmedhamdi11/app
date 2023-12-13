import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, -0.25),
      child: Animate(
        effects: const [
          FadeEffect(duration: Duration(milliseconds: 850)),
        ],
        child: SvgPicture.asset(
          'assets/images/secure_shield_logo.svg',
          width: 180,
          height: 180,
        ),
      ),
    );
  }
}
