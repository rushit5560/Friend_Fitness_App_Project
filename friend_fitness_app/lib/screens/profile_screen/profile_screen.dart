import 'package:flutter/material.dart';
import 'package:friend_fitness_app/common/extension_methods/extension_methods.dart';
import 'package:friend_fitness_app/screens/profile_screen/profile_screen_widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProfileScreenAppBarModule(),
            const SizedBox(height: 15),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    ProfileImage(),
                    SizedBox(height: 35),
                    NameTextFieldModule(),
                    SizedBox(height: 20),
                    WeightTextFieldModule(),
                    SizedBox(height: 20),
                    MeasurementTextFieldModule(),
                    SizedBox(height: 20),
                    HeightTextFieldModule(),
                    SizedBox(height: 30),
                    SaveButtonModule(),
                    SizedBox(height: 30),
                    BeforeAfterImageModule(),
                    SizedBox(height: 20),
                  ],
                ).commonAllSidePadding(),
              ),
            )

          ],
        ),
      ),
    );
  }
}
