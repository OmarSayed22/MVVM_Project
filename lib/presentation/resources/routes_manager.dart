import 'package:flutter/material.dart';
import 'package:flutter_advanced/presentation/forgot_password/forgot_password_view.dart';
import 'package:flutter_advanced/presentation/home/home_view.dart';
import 'package:flutter_advanced/presentation/on_boarding/view/on_boarding_view.dart';
import 'package:flutter_advanced/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced/presentation/sign_up/sign_up_view.dart';
import 'package:flutter_advanced/presentation/splash/splash_view.dart';
import 'package:flutter_advanced/presentation/store_details/store_details.dart';
import '../login/view/login_view.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String signUpRoute = "/signUp";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String homeRoute = "/home";
  static const String storeDetailsRoute = "/storeDetails";
}

class RouteGenerator {
  static Route<dynamic> getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.signUpRoute:
        return MaterialPageRoute(builder: (_) => SignUpView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => HomeView());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => StoreDetails());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() => MaterialPageRoute(
      builder: (_) => Scaffold(
            appBar: AppBar(
              title: const Text(AppStringsManager.noRouteFound),
            ),
            body: const Center(child: Text(AppStringsManager.noRouteFound)),
          ));
}
