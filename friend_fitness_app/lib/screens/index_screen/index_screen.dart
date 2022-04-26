import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/index_screen_controller/index_screen_controller.dart';

class IndexScreen extends StatelessWidget {
  IndexScreen({Key? key}) : super(key: key);
  final indexScreenController = Get.put(IndexScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
