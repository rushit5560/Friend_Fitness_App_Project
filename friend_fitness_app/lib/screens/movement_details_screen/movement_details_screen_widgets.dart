import 'package:flutter/material.dart';
import 'package:friend_fitness_app/common/constants/app_colors.dart';
import 'package:friend_fitness_app/common/extension_methods/extension_methods.dart';
import 'package:get/get.dart';

/// AppBar
class MovementDetailsScreenAppBarModule extends StatelessWidget {
  MovementDetailsScreenAppBarModule({Key? key}) : super(key: key);
  //final screenController = Get.find<ExerciseDetailsScreenController>();

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
              width: 50,
              child: Icon(
                Icons.arrow_back_ios_rounded,
                size: 25,
              ),
            ),
          ),
          Expanded(
            child: Text(
              "Fitness Name",
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Container(
            width: 50,
          ),
        ],
      ),
    );
  }
}

class MovementDetailsListModule extends StatelessWidget {
  const MovementDetailsListModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        movementDetailsHeadingModule(),
        movementDetailsList()
      ],
    );
  }

  movementDetailsHeadingModule(){
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

  movementDetailsList(){
    return ListView.builder(
      itemCount: 3,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        //WaterIntakeEntryModel singleItem = screenController.waterIntakeRecordList[i];
        return _listTile();
      },
    );
  }

  Widget _listTile() {
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
            "13-05-2022",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            "1",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

        ],
      ).commonAllSidePadding(),
    ).commonSymmetricPadding(vertical: 10);
  }
}
