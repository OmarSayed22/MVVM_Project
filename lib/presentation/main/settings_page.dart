import 'package:flutter/material.dart';

import '../resources/strings_manager.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SettingsPageState();
  }
}

class SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text(AppStringsManager.settings));
  }
}
