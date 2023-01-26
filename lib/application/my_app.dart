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
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getAppTheme(),
      onGenerateRoute: RouteGenerator.getRoutes,
      initialRoute: Routes.splashRoute,
    );
  }
}
