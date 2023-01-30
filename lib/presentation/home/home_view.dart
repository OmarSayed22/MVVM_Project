import 'package:flutter/material.dart';
import '../resources/resources.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeViewState();
  }
}

class HomeViewState extends State<HomeView> {
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
