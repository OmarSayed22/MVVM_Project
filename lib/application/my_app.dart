import 'package:flutter/material.dart';
import 'package:flutter_advanced/presentation/resources/resources.dart';

class MyApp extends StatefulWidget {
  //singleton or single instance app class
  const MyApp._internal();

  static MyApp _instance() => const MyApp._internal();

  factory MyApp() => _instance();

  //-------------------------------------------------------
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, SplashView) {
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: SplashView!);
      },
      debugShowCheckedModeBanner: false,
      theme: getAppTheme(),
      onGenerateRoute: RouteGenerator.getRoutes,
    );
  }
}
