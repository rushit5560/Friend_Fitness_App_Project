import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:friend_fitness_app/screens/splash_screen/splash_screen.dart';
import 'package:get/get.dart';
import 'common/app_theme/app_theme.dart';
import 'screens/sign_in_screen/sign_in_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: SplashScreen(),
    );
  }
}

