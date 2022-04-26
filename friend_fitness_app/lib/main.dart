import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/profile_screen/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Friends Fitness App',
      theme: appLightTheme(),
      home: const ProfileScreen(),
    );
  }
}

