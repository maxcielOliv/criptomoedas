import 'package:criptomoedas/App.dart';
import 'package:criptomoedas/configs/app_settings.dart';
import 'package:criptomoedas/configs/hive_config.dart';
import 'package:criptomoedas/repository/conta_repository.dart';
import 'package:criptomoedas/repository/favoritas_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveConfig.start();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ContaRepository()),
        ChangeNotifierProvider(create: (context) => AppSettings()),
        ChangeNotifierProvider(create: (context) => FavoritasRepository()),
        
      ],
      child: App(),
    ),
  );
}
