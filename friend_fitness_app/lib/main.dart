import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'common/app_theme/app_theme.dart';
import 'screens/sign_in_screen/sign_in_screen.dart';
import 'screens/sign_up_screen/sign_up_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Friends Fitness App',
      debugShowCheckedModeBanner: false,
      theme: appLightTheme(),
      home: SignInScreen(),
    );
  }
}

