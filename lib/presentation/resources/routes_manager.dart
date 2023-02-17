import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced/application/dependency_injection.dart';
import 'package:flutter_advanced/presentation/forgot_password/forgot_password_view.dart';
import 'package:flutter_advanced/presentation/on_boarding/view/on_boarding_view.dart';
import 'package:flutter_advanced/presentation/resources/strings_manager.dart';
import 'package:flutter_advanced/presentation/sign_up/sign_up_view.dart';
import 'package:flutter_advanced/presentation/splash/splash_view.dart';
import 'package:flutter_advanced/presentation/store_details/view/store_details.dart';

import '../login/view/login_view.dart';
import '../main/main_view.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String signUpRoute = "/signUp";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/home";
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
        initLoginModule();
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.signUpRoute:
        initSignupModule();
        return MaterialPageRoute(builder: (_) => const SignUpView());
      case Routes.forgotPasswordRoute:
        initForgetPasswordModule();
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case Routes.mainRoute:
        initHomeModule();
        return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.storeDetailsRoute:
        initStoreDetailsModule();
        return MaterialPageRoute(builder: (_) => const StoreDetails());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() => MaterialPageRoute(
      builder: (_) => Scaffold(
            appBar: AppBar(
              title: Text(AppStringsManager.noRouteFound.tr()),
            ),
            body: Center(child: Text(AppStringsManager.noRouteFound.tr())),
          ));
}
