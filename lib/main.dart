import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced/application/dependency_injection.dart';
import 'package:flutter_advanced/presentation/resources/language_manager.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'application/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initAppModule();
  runApp(EasyLocalization(
      supportedLocales: const [englishLocal, arabicLocal],
      path: assetsPathLocalization,
      child: Phoenix(
        child: MyApp(),
      )));
}
