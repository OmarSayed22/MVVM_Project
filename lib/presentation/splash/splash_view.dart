import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_advanced/presentation/resources/resources.dart';

import '../resources/assets_manager.dart';
import '../resources/colors_manager.dart';
import '../resources/routes_manager.dart';

class SplashView extends StatefulWidget{
  const SplashView({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SplashViewState();
  }
  
}
class SplashViewState extends State<SplashView>{
  Timer? _timer;
void _startDelayed(){
  _timer = Timer(const Duration(seconds: AppDuration.splashViewDuration),_goToNext);
}

void _goToNext(){
  Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
}

  @override
  void initState() {
    super.initState();
    _startDelayed() ;
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
      body:Center(child: Image.asset(ImageAssets.splashLogo)),
    );
  }
  
}