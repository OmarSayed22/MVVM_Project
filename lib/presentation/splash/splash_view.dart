import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_advanced/application/app_preferences.dart';
import 'package:flutter_advanced/application/dependency_injection.dart';
import 'package:flutter_advanced/presentation/resources/resources.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SplashViewState();
  }
}

class SplashViewState extends State<SplashView> {
  Timer? _timer;

  void _startDelayed() {
    _timer = Timer(Duration(seconds: splashDuration), _goToNext);
  }

  void _goToNext() async {
    // when get instance from AppPreferences before starting causing exception
    final AppPreferences appPreferences = instance<AppPreferences>();
    await appPreferences.isLoggedIn().then((isLoggedIn) {
      if (isLoggedIn) {
        Navigator.pushReplacementNamed(context, Routes.mainRoute);
      } else {
        appPreferences.isOnBoardingComplete().then((isOnBoardingComplete) {
          if (isOnBoardingComplete) {
            Navigator.pushReplacementNamed(context, Routes.loginRoute);
          } else {
            Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
          }
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _startDelayed();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: ColorsManager.primaryColor,
      body: Center(child: Image.asset(ImageAssets.splashLogo)),
    );
  }
}
