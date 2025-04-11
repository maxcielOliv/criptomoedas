import 'package:criptomoedas/App.dart';
import 'package:criptomoedas/repository/favoritas_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FavoritasRepository(),
      child: App(),
    ),
  );
}
