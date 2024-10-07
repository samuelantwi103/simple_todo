import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:simple_todo/home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  get splash => null;

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              height: 0.3 * MediaQuery.of(context).size.height,
              child: const Text("Simple TODO"),
            ),
          ]),
        ),
      ),
      splashIconSize: 400,
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      nextScreen: const HomePage(),
    );
  }
}
