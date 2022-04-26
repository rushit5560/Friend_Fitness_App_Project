import 'package:flutter/material.dart';
import 'package:friend_fitness_app/screens/profile_screen/profile_screen_widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            ProfileScreenAppBarModule(),
            ProfileImage()
          ],
        ),
      ),
    );
  }
}
