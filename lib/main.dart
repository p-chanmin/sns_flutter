import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final String? token = prefs.getString('token');

  runApp(MyApp(token));
}
