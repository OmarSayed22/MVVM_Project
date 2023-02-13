import 'package:flutter/material.dart';
import 'package:flutter_advanced/presentation/main/home/view/home_page.dart';
import 'package:flutter_advanced/presentation/main/search_page.dart';
import 'package:flutter_advanced/presentation/main/settings_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/resources.dart';
import 'notification_page.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainViewState();
  }
}

class MainViewState extends State<MainView> {
  final List<Widget> _pages = [
    HomePage(),
    const SearchPage(),
    const NotificationPage(),
    SettingsPage(),
  ];

  int currentIndex = 0;
  List<String> titles = [
    AppStringsManager.home,
    AppStringsManager.search,
    AppStringsManager.notification,
    AppStringsManager.settings,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[currentIndex],
            style: Theme.of(context).textTheme.titleSmall),
      ),
      body: _pages[currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: ColorsManager.grayColor1, spreadRadius: AppSize.size1)
          ],
        ),
        child: BottomNavigationBar(
          selectedItemColor: ColorsManager.primaryColor,
          unselectedItemColor: ColorsManager.grayColor1,
          currentIndex: currentIndex,
          onTap: onTap,
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(ImageAssets.home),
                label: AppStringsManager.home),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(ImageAssets.search),
                label: AppStringsManager.search),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(ImageAssets.notification),
                label: AppStringsManager.notification),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(ImageAssets.settings),
                label: AppStringsManager.settings),
          ],
        ),
      ),
    );
  }

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
