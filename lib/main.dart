import 'package:flutter/material.dart';
import 'application/dependency_injection.dart';
import 'application/my_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initAppModule();
  runApp(MyApp());
}
