import 'package:flutter/material.dart';
import 'package:flutter_advanced/presentation/resources/resources.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ForgotPasswordViewState();
  }
}

class ForgotPasswordViewState extends State<ForgotPasswordView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amberAccent,
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
