import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced/application/app_preferences.dart';
import 'package:flutter_advanced/application/dependency_injection.dart';
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
  final AppPreferences _appPreferences = instance<AppPreferences>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
//
    _appPreferences.getLanguageLocal().then((local) {
      context.setLocale(local);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
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
