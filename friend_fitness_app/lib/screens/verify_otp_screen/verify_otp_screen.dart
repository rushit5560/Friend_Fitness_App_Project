import 'package:flutter/material.dart';
import 'package:friend_fitness_app/common/extension_methods/extension_methods.dart';
import 'package:friend_fitness_app/controllers/verify_otp_screen_controller/verify_otp_screen_controller.dart';
import 'package:friend_fitness_app/screens/verify_otp_screen/verify_otp_screen_widgets.dart';
import 'package:get/get.dart';

class VerifyOtpScreen extends StatelessWidget {
  VerifyOtpScreen({Key? key}) : super(key: key);
  final verifyOtpScreenController = Get.put(VerifyOtpScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            VerifyOtpScreenAppBarModule(),
            const SizedBox(height: 15),
            Expanded(
              child: Form(
                key: verifyOtpScreenController.verifyOtpFormKey,
                child: Column(
                  children: [
                    OtpTextFieldModule(),
                    const SizedBox(height: 50),
                    VerifyOtpButtonModule(),
                    const SizedBox(height: 15),
                  ],
                ),
              ).commonSymmetricPadding(horizontal: 25),
            )

          ],
        )
      ),
    );
  }
}
