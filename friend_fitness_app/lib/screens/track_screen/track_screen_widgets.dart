import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:friend_fitness_app/common/constants/app_colors.dart';
import 'package:friend_fitness_app/common/constants/app_images.dart';
import 'package:friend_fitness_app/common/extension_methods/extension_methods.dart';
import 'package:friend_fitness_app/controllers/track_screen_controller/track_screen_controller.dart';
import 'package:friend_fitness_app/model/home_screen_models/fitness_model.dart';
import 'package:friend_fitness_app/screens/exercise_details_screen/exercise_details_screen.dart';
import 'package:get/get.dart';

class TrackScreenAppBarModule extends StatelessWidget {
  const TrackScreenAppBarModule({Key? key}) : super(key: key);

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
          Container(),
          const Text(
            "Track",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Container(),
        ],
      ),
    );
  }
}

/// Track Exercise
class TrackExerciseModule extends StatelessWidget {
  TrackExerciseModule({Key? key}) : super(key: key);
  final screenController = Get.find<TrackScrenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Track Exercise",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: 170,
          child: GridView.builder(
            itemCount: screenController.exerciseList.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, i) {
              FitnessModel singleExercise = screenController.exerciseList[i];
              return _trackExerciseGridTile(singleExercise)
                  .commonSymmetricPadding(vertical: 8);
            },
          ).commonSymmetricPadding(vertical: 10),
        ),
      ],
    );
  }

  Widget _trackExerciseGridTile(FitnessModel singleItem) {
    return GestureDetector(
      onTap: () {
        Get.to(()=>
            ExerciseDetailsScreen(),
            transition: Transition.zoom,
            arguments: singleItem
        );
      },
      child: Container(
        alignment: Alignment.center,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 75,
              child: Image.network(singleItem.fitnessImage, fit: BoxFit.cover).commonAllSidePadding(),
            ),
            // const SizedBox(height: 5),
            Expanded(
              flex: 25,
              child: Text(
                singleItem.fitnessName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
      ).commonAllSidePadding(padding: 5),
    );
  }
}

/// Track Movement
class TrackMovementModule extends StatelessWidget {
  TrackMovementModule({Key? key}) : super(key: key);
  final screenController = Get.find<TrackScrenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          "Track Movement",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: 170,
          child: GridView.builder(
            itemCount: screenController.movementList.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, i) {
              FitnessModel singleMovement = screenController.movementList[i];
              return _trackMovementGridTile(singleMovement)
                  .commonSymmetricPadding(vertical: 8);
            },
          ).commonSymmetricPadding(vertical: 10),
        ),
      ],
    );
  }

  Widget _trackMovementGridTile(FitnessModel singleItem) {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 75,
            child: Image.network(singleItem.fitnessImage, fit: BoxFit.cover).commonAllSidePadding(),
          ),
          // const SizedBox(height: 5),
          Expanded(
            flex: 25,
            child: Text(
              singleItem.fitnessName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    ).commonAllSidePadding(padding: 5);
  }

}

/// Track Water Intake
class TrackWaterIntakeModule extends StatelessWidget {
  TrackWaterIntakeModule({Key? key}) : super(key: key);
  final screenController = Get.find<TrackScrenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Track Water Intake",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),

        Container(
          width: Get.width,
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
            children: [

              Container(
                width: 55,
                height: 80,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(screenController.waterIntakeList[0].waterIntakeImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ).commonSymmetricPadding(vertical: 10, horizontal: 10),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      screenController.waterIntakeList[0].waterIntakeName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      screenController.waterIntakeList[0].waterIntakeDes,
                      style: const TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      screenController.waterIntakeValue.value++;
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.colorDarkGrey,
                      ),
                      child: Center(
                        child: const Icon(
                          Icons.add_rounded,
                          color: Colors.white,
                          size: 18,
                        ).commonAllSidePadding(padding: 8),
                      ),
                    ),
                  ),

                  Obx(
                        ()=> Text(
                      "${screenController.waterIntakeValue.value}",
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ).commonSymmetricPadding(horizontal: 10),
                  ),

                  GestureDetector(
                    onTap: () {
                      if(screenController.waterIntakeValue.value < 1) {
                        log("Value ${screenController.waterIntakeValue.value}");
                      } else {
                        screenController.waterIntakeValue.value--;
                      }

                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.colorDarkGrey,
                      ),
                      child: Center(
                        child: const Icon(
                          Icons.remove_rounded,
                          color: Colors.white,
                          size: 18,
                        ).commonAllSidePadding(padding: 8),
                      ),
                    ),
                  ),

                ],
              ),
            ],
          ).commonAllSidePadding(padding: 15),
        ).commonAllSidePadding(),

        Container(
          width: Get.width,
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
            children: [

              Container(
                width: 38,
                height: 50,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.glassImg),
                    fit: BoxFit.cover,
                  ),
                ),
              ).commonSymmetricPadding(vertical: 10, horizontal: 10),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text(
                      "Water",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Glasses",
                      style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      screenController.waterIntakeValue.value++;
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.colorDarkGrey,
                      ),
                      child: Center(
                        child: const Icon(
                            Icons.add_rounded,
                          color: Colors.white,
                          size: 18,
                        ).commonAllSidePadding(padding: 8),
                      ),
                    ),
                  ),

                  Obx(
                    ()=> Text(
                        "${screenController.waterIntakeValue.value}",
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ).commonSymmetricPadding(horizontal: 10),
                  ),

                  GestureDetector(
                    onTap: () {
                      if(screenController.waterIntakeValue.value < 1) {
                        log("Value ${screenController.waterIntakeValue.value}");
                      } else {
                        screenController.waterIntakeValue.value--;
                      }

                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.colorDarkGrey,
                      ),
                      child: Center(
                        child: const Icon(
                          Icons.remove_rounded,
                          color: Colors.white,
                          size: 18,
                        ).commonAllSidePadding(padding: 8),
                      ),
                    ),
                  ),

                ],
              ),
            ],
          ).commonAllSidePadding(padding: 15),
        ).commonAllSidePadding(),
      ],
    );
  }
}

/// Track Time Spend on Mindfulness
class TrackTimeSpendOnMindFullnessModule extends StatelessWidget {
  TrackTimeSpendOnMindFullnessModule({Key? key}) : super(key: key);
  final screenController = Get.find<TrackScrenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          "Track Time Spend on Mindfulness",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: 170,
          // child: StreamBuilder<List<MindfulnessModel>>(
          //   stream: screenController.getAllMindfulnessFromFirebase(),
          //   builder: (context, snapshot) {
          //     if (snapshot.hasError) {
          //       return Text("Something went wrong! ${snapshot.error}");
          //     } else if (snapshot.hasData) {
          //       final mindfulness = snapshot.data;
          //
          //       return GridView.builder(
          //         itemCount: mindfulness!.length,
          //         shrinkWrap: true,
          //         physics: const BouncingScrollPhysics(),
          //         scrollDirection: Axis.horizontal,
          //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //           crossAxisCount: 1,
          //           mainAxisSpacing: 10,
          //           crossAxisSpacing: 10,
          //         ),
          //         itemBuilder: (context, i) {
          //           MindfulnessModel singleMindfulness = mindfulness[i];
          //           return _trackTimeSpendOnMindFullnessGridTile(singleMindfulness)
          //               .commonSymmetricPadding(vertical: 8);
          //         },
          //       ).commonSymmetricPadding(vertical: 10);
          //
          //     } else {
          //       return const CustomCircularProgressIndicator();
          //     }
          //   },
          // ),
          child: GridView.builder(
            itemCount: screenController.mindfulnessList.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, i) {
              FitnessModel singleItem = screenController.mindfulnessList[i];
              return _trackTimeSpendOnMindFullnessGridTile(singleItem);
            },
          ).commonSymmetricPadding(vertical: 10),
        ),
      ],
    );
  }

  Widget _trackTimeSpendOnMindFullnessGridTile(FitnessModel singleItem) {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 75,
            child: Image.network(singleItem.fitnessImage, fit: BoxFit.cover).commonAllSidePadding(),
          ),
          // const SizedBox(height: 5),
          Expanded(
            flex: 25,
            child: Text(
              singleItem.fitnessName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    ).commonAllSidePadding(padding: 5);
  }

}