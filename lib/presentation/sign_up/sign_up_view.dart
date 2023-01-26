import 'package:flutter/material.dart';
import 'package:flutter_advanced/presentation/resources/colors_manager.dart';

import '../resources/routes_manager.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SignUpViewState();
  }
}

class SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: ColorsManager.errorColor,
      child: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: ColorsManager.darkGrayColor),
          onPressed: () {
            Navigator.popAndPushNamed(context, Routes.loginRoute);
          },
          child: null,
        ),
      ),
    );
  }
}
