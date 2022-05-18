import 'package:flutter/material.dart';
import 'package:friend_fitness_app/common/constants/app_images.dart';
import 'package:friend_fitness_app/common/extension_methods/extension_methods.dart';
import 'package:get/get.dart';
import '../../common/constants/app_colors.dart';
import '../../controllers/exercise_details_screen_controller/exercise_details_screen_controller.dart';

/// AppBar
class ExerciseDetailsScreenAppBarModule extends StatelessWidget {
  ExerciseDetailsScreenAppBarModule({Key? key}) : super(key: key);
  final screenController = Get.find<ExerciseDetailsScreenController>();

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
                Icons.arrow_back,
                size: 25,
              ),
            ),
          ),
          Expanded(
            child: Text(
              //screenController.singleItem.fitnessName,
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

class ExerciseDetailsListModule extends StatelessWidget {
  const ExerciseDetailsListModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         exerciseDetailsHeadingModule(),
        exerciseDetailsList()
      ],
    );
  }

  exerciseDetailsHeadingModule(){
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

  exerciseDetailsList(){
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


/// Exercise Image Module
class ImageModule extends StatelessWidget {
  const ImageModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.40,
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
      child: Image.asset(
        AppImages.exerciseImg,
        fit: BoxFit.contain,
      ).commonAllSidePadding(padding: 20),
    ).commonAllSidePadding(padding: 25);
  }
}

/// Time Text Module
class TimerTextModule extends StatelessWidget {
  const TimerTextModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          "20:12",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

/// Play & Pause Button
class PlayButtonModule extends StatelessWidget {
  PlayButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<ExerciseDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        screenController.isPlay.value = !screenController.isPlay.value;
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.colorDarkGrey,
        ),
        child: Obx(
          ()=> Icon(
            screenController.isPlay.value
                ? Icons.pause_rounded
                : Icons.play_arrow_rounded,
            color: Colors.white,
            size: 50,
          ).commonAllSidePadding(padding: 5),
        ),
      ),
    );
  }
}
