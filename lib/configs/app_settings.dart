import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class AppSettings extends ChangeNotifier {
  //late SharedPreferences _prefs;
  late Box box;
  Map<String, String> locale = {'locale': 'pt_BR', 'name': 'R\$'};

  AppSettings() {
    _startSettings();
  }

  _startSettings() async {
    await _startPreferences();
    await _readLocale();
  }

  Future<void> _startPreferences() async {
    //_prefs = await SharedPreferences.getInstance();
    box = await Hive.openBox('preferencias');

  }

  _readLocale() async {
    //final local = _prefs.getString('locale') ?? 'pt_BR';
    //final name = _prefs.getString('name') ?? 'R\$';
    final local = box.get('locale') ?? 'pt_BR';
    final name = box.get('name') ?? 'R\$';
    locale = {
      'locale': local,
      'name': name,
    };
    notifyListeners();
  }

  setLocale(String local, String name) async {
    //await _prefs.setString('local', local);
    //await _prefs.setString('name', name);
    await box.put('locale', local);
    await box.put('name', name);
    await _readLocale();
  }
}
