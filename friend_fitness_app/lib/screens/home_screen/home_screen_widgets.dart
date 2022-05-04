import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:friend_fitness_app/common/extension_methods/extension_methods.dart';
import 'package:friend_fitness_app/model/home_screen_models/movement_model.dart';
import 'package:friend_fitness_app/model/home_screen_models/water_intake_model.dart';
import 'package:friend_fitness_app/screens/profile_screen/profile_screen.dart';
import 'package:get/get.dart';
import '../../common/common_widgets.dart';
import '../../common/constants/app_colors.dart';
import '../../common/constants/app_images.dart';
import '../../controllers/home_screen_controller/home_screen_controller.dart';
import '../../model/home_screen_models/exercise_model.dart';
import '../../model/home_screen_models/mindfulness_model.dart';


/// AppBar
class HomeScreenAppBarModule extends StatelessWidget {
  const HomeScreenAppBarModule({Key? key}) : super(key: key);

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
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: GestureDetector(
              onTap: () {
                Get.to(()=> const ProfileScreen(), transition: Transition.leftToRight);
              },
              child: Container(
                height: 42,
                width: 42,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage(AppImages.profileImg),
                  ),
                ),
              ),
            ),
          ),
          const Text(
            "",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Container(),
        ],
      ),
    );
  }
}

/// Leader Board
class LeaderBoardModule extends StatelessWidget {
  const LeaderBoardModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "LeaderBoard",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 15),
        Container(
          height: 250,
          decoration: BoxDecoration(
            color: Colors.white,
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
            children: [
              SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, i) {
                    return _leaderBoardListTile();
                  },
                ).commonAllSidePadding(padding: 8),
              ),
              // const SizedBox(height: 5),
              SizedBox(
                height: 50,
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.colorDarkGrey,
                    ),
                    child: Text(
                      "See All",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.colorLightGrey,
                        fontSize: 14,
                      ),
                    ).commonSymmetricPadding(horizontal: 20, vertical: 10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ).commonSymmetricPadding(horizontal: 10);
  }

  Widget _leaderBoardListTile() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.colorLightGrey1,
      ),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(AppImages.personImg),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Text(
              "John Doe",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
          const SizedBox(width: 10),
          const Text(
            "1",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
            ),
          ),
        ],
      ).commonAllSidePadding(padding: 12),
    ).commonAllSidePadding(padding: 5);
  }
}

/// Track Exercise
class TrackExerciseModule extends StatelessWidget {
  TrackExerciseModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

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
          height: 130,
          child: StreamBuilder<List<ExerciseModel>>(
            stream: screenController.getAllExerciseFromFirebase(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("Something went wrong! ${snapshot.error}");
              } else if (snapshot.hasData) {
                final exercises = snapshot.data;

                return GridView.builder(
                  itemCount: exercises!.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, i) {
                    ExerciseModel singleExercise = exercises[i];
                    return _trackExerciseGridTile(singleExercise)
                        .commonSymmetricPadding(vertical: 8);
                  },
                ).commonSymmetricPadding(vertical: 10);

              } else {
                return const CustomCircularProgressIndicator();
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _trackExerciseGridTile(ExerciseModel singleItem) {
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
            child: Image.network(singleItem.exerciseImage, fit: BoxFit.cover).commonAllSidePadding(),
          ),
          // const SizedBox(height: 5),
          Expanded(
            flex: 25,
            child: Text(
              singleItem.exerciseName,
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

/// Track Movement
class TrackMovementModule extends StatelessWidget {
  TrackMovementModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

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
          height: 130,
          child: StreamBuilder<List<MovementModel>>(
            stream: screenController.getAllMovementFromFirebase(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("Something went wrong! ${snapshot.error}");
              } else if (snapshot.hasData) {
                final movements = snapshot.data;

                return GridView.builder(
                  itemCount: movements!.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, i) {
                    MovementModel singleMovement = movements[i];
                    return _trackMovementGridTile(singleMovement)
                        .commonSymmetricPadding(vertical: 8);
                  },
                ).commonSymmetricPadding(vertical: 10);

              } else {
                return const CustomCircularProgressIndicator();
              }
            },
          ),
          /*child: GridView.builder(
            itemCount: screenController.trackMovementList.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, i) {
              TrackExerciseModel singleItem = screenController.trackMovementList[i];
              return _trackMovementGridTile(singleItem);
            },
          ).commonSymmetricPadding(vertical: 10),*/
        ),
      ],
    );
  }

  Widget _trackMovementGridTile(MovementModel singleItem) {
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
            child: Image.network(singleItem.movementImage, fit: BoxFit.cover).commonAllSidePadding(),
          ),
          // const SizedBox(height: 5),
          Expanded(
            flex: 25,
            child: Text(
              singleItem.movementName,
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
  final screenController = Get.find<HomeScreenController>();

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

        StreamBuilder<List<WaterIntakeModel>>(
          stream: screenController.getWaterIntakeFromFirebase(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("Something went wrong! ${snapshot.error}");
            } else if (snapshot.hasData) {
              // final movements = snapshot.data;
              return Container(
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
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(snapshot.data![0].waterIntakeImage),
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
                            snapshot.data![0].waterIntakeName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            snapshot.data![0].waterIntakeDes,
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
              ).commonAllSidePadding();
              /*return GridView.builder(
                itemCount: movements!.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, i) {
                  MovementModel singleMovement = movements[i];
                  return _trackMovementGridTile(singleMovement)
                      .commonSymmetricPadding(vertical: 8);
                },
              ).commonSymmetricPadding(vertical: 10);*/

            } else {
              return const CustomCircularProgressIndicator();
            }
          },
        ),

        /*Container(
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
        ).commonAllSidePadding(),*/
      ],
    );
  }
}

/// Track Time Spend on Mindfulness
class TrackTimeSpendOnMindFullnessModule extends StatelessWidget {
  TrackTimeSpendOnMindFullnessModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

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
          height: 130,
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
              MindfulnessModel singleItem = screenController.mindfulnessList[i];
              return _trackTimeSpendOnMindFullnessGridTile(singleItem);
            },
          ).commonSymmetricPadding(vertical: 10),
        ),
      ],
    );
  }

  Widget _trackTimeSpendOnMindFullnessGridTile(MindfulnessModel singleItem) {
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
            child: Image.network(singleItem.mindfulnessImage, fit: BoxFit.cover).commonAllSidePadding(),
          ),
          // const SizedBox(height: 5),
          Expanded(
            flex: 25,
            child: Text(
              singleItem.mindfulnessName,
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

