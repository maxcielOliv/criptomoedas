
import 'package:criptomoedas/ui/pages/home_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        primaryColor: Colors.indigo,
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white)
        )
      ),
      color: Colors.indigo,
      home: HomePage(),
    );
  }
}