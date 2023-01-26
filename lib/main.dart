import 'package:flutter/material.dart';
import 'application/dependencey_injection.dart';
import 'application/my_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initAppModule();
  runApp(MyApp());
}
