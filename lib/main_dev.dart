import 'package:flutter/material.dart';
import 'core/config/app_config.dart';
import 'app.dart';
import 'injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  AppConfig.initialize(
    environment: Environment.dev,
    apiUrl: 'https://dev-api.tupetapp.com',
  );

  await configureDependencies();

  runApp(const MyApp());
}
