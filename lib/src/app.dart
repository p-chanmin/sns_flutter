import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sns_flutter/src/screen/user/register.dart';
import 'screen/home.dart';

class MyApp extends StatelessWidget {
  String? token;
  MyApp(this.token, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: (token == null) ? Register() : Home(),
    );
  }
}
