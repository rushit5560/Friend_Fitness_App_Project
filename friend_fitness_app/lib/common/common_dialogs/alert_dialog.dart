import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Are you sure you want\nto cancel the payment ?',
        textAlign: TextAlign.center,
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      contentPadding: const EdgeInsets.symmetric(vertical: 40),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      titleTextStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                Get.back();
                Get.back();
              },
              child: const Text(
                'Yes',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 17,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text(
                'No',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 17,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
