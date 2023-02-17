import 'package:easy_localization/easy_localization.dart';
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
    return MainViewState();
  }
}

class MainViewState extends State<MainView> {
  final List<Widget> _pages = [
    const HomePage(),
    const SearchPage(),
    const NotificationPage(),
    const SettingsPage(),
  ];

  int currentIndex = 0;
  List<String> titles = [
    AppStringsManager.home.tr(),
    AppStringsManager.search.tr(),
    AppStringsManager.notification.tr(),
    AppStringsManager.settings.tr(),
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
                label: AppStringsManager.home.tr()),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(ImageAssets.search),
                label: AppStringsManager.search.tr()),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(ImageAssets.notification),
                label: AppStringsManager.notification.tr()),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(ImageAssets.settings),
                label: AppStringsManager.settings.tr()),
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
