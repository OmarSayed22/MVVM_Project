import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced/application/app_preferences.dart';
import 'package:flutter_advanced/data/local/data_sources/local_data_source.dart';
import 'package:flutter_advanced/presentation/resources/resources.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_svg/svg.dart';

import '../../application/dependency_injection.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return SettingsPageState();
  }
}

class SettingsPageState extends State<SettingsPage> {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final LocalDataSource _localDataSource = instance<LocalDataSource>();

  @override
  Widget build(BuildContext context) {
    List<Widget> listTitles = [
      ListTile(
        onTap: () {
          _changeLang();
        },
        leading: SvgPicture.asset(ImageAssets.changeLangIc),
        title: Text(
          AppStringsManager.changeLanguage.tr(),
          style: Theme.of(context).textTheme.displaySmall,
        ),
        trailing: SvgPicture.asset(ImageAssets.settingsRightArrowIc),
      ),
      ListTile(
        onTap: () {},
        leading: SvgPicture.asset(ImageAssets.contactUsIc),
        title: Text(
          AppStringsManager.contactUs.tr(),
          style: Theme.of(context).textTheme.displaySmall,
        ),
        trailing: SvgPicture.asset(ImageAssets.settingsRightArrowIc),
      ),
      ListTile(
        onTap: () {},
        leading: SvgPicture.asset(ImageAssets.inviteFriendsIc),
        title: Text(
          AppStringsManager.inviteYourFriends.tr(),
          style: Theme.of(context).textTheme.displaySmall,
        ),
        trailing: SvgPicture.asset(ImageAssets.settingsRightArrowIc),
      ),
      ListTile(
        onTap: () {
          _logout();
        },
        leading: SvgPicture.asset(ImageAssets.logout),
        title: Text(
          AppStringsManager.logout.tr(),
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
    ];

    return ListView.separated(
      padding: const EdgeInsets.all(AppPadding.p12),
      itemBuilder: (BuildContext context, int index) => listTitles[index],
      separatorBuilder: (BuildContext context, int index) => const Divider(
        thickness: AppSize.size2,
      ),
      itemCount: listTitles.length,
    );
  }

  _changeLang() {
    _appPreferences.changeLanguage();
    Phoenix.rebirth(context);
  }

  _contactUs() {}

  _inviteFriends() {}

  _logout() {
    _appPreferences.logout();
    _localDataSource.clearCache();
    Navigator.pushReplacementNamed(context, Routes.loginRoute);
  }
}
