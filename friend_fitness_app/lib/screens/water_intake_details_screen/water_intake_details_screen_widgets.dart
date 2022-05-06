import 'package:flutter/material.dart';
import 'package:friend_fitness_app/common/extension_methods/extension_methods.dart';
import 'package:friend_fitness_app/model/water_intake_record_model/water_intake_record_model.dart';
import 'package:get/get.dart';

import '../../common/constants/app_colors.dart';
import '../../controllers/water_intake_details_screen_controller/water_intake_details_screen_controller.dart';


/// AppBar
class WaterIntakeDetailsScreenAppBarModule extends StatelessWidget {
  WaterIntakeDetailsScreenAppBarModule({Key? key}) : super(key: key);
  final screenController = Get.find<WaterIntakeDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
          color: AppColors.colorLightGrey
        //color: Colors.grey
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: const SizedBox(
              width: 42,
              height: 42,
              child: Icon(
                  Icons.arrow_back_ios_rounded
              ),
            ),
          ),
          Text(
            screenController.waterIntakeData.waterIntakeName,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            width: 42,
            height: 42,
          ),
        ],
      ),
    );
  }
}

/// Water Intake List Module
class WaterIntakeListModule extends StatelessWidget {
  WaterIntakeListModule({Key? key}) : super(key: key);
  final screenController = Get.find<WaterIntakeDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const WaterIntakeHeadingModule(),
        Expanded(
          child: ListView.builder(
            itemCount: screenController.waterIntakeRecordList.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, i) {
              WaterIntakeEntryModel singleItem = screenController.waterIntakeRecordList[i];
              return _listTile(singleItem);
            },
          ),
        ),
      ],
    );
  }

  Widget _listTile(WaterIntakeEntryModel singleItem) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            blurStyle: BlurStyle.outer,
            color: AppColors.colorLightGrey,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Text(
            singleItem.date,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            singleItem.point.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

        ],
      ).commonAllSidePadding(),
    ).commonSymmetricPadding(vertical: 10);
  }


}



/// Heading Module
class WaterIntakeHeadingModule extends StatelessWidget {
  const WaterIntakeHeadingModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          "Date",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),

        Text(
          "Points",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    ).commonSymmetricPadding(horizontal: 10);
  }
}
