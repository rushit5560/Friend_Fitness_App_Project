import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:friend_fitness_app/common/constants/app_colors.dart';
import 'package:friend_fitness_app/common/constants/app_images.dart';
import 'package:friend_fitness_app/common/extension_methods/extension_methods.dart';
import 'package:friend_fitness_app/common/user_details.dart';
import 'package:friend_fitness_app/controllers/category_screen_controller/category_screen_controller.dart';
import 'package:friend_fitness_app/controllers/track_screen_controller/track_screen_controller.dart';
import 'package:friend_fitness_app/model/category_model/category_model.dart';
import 'package:friend_fitness_app/model/home_screen_models/fitness_model.dart';
import 'package:friend_fitness_app/screens/category_details_screen/category_details_screen.dart';
import 'package:friend_fitness_app/screens/exercise_details_screen/exercise_details_screen.dart';
import 'package:friend_fitness_app/screens/movement_details_screen/movement_details_screen.dart';
import 'package:friend_fitness_app/screens/time_spend_mindfulness_details_screen/time_spend_mindfulness_details_screen.dart';
import 'package:friend_fitness_app/screens/water_intake_details_screen/water_intake_details_screen.dart';
import 'package:get/get.dart';

import '../../controllers/home_screen_controller/home_screen_controller.dart';

/// AppBar
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
          bottomLeft: Radius.circular(25),
        ),
        color: AppColors.colorLightGrey,
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

/// Tabs Module
class MainTabsModule extends StatelessWidget {
  final screenController = Get.find<TrackScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 10),
              child: GestureDetector(
                onTap: () {
                  screenController.isPositiveSelected.value = true;
                  screenController.isNegativeSelected.value = false;
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                    Border.all(color: AppColors.colorDarkGrey, width: 2),
                    color: screenController.isPositiveSelected.value
                        ? AppColors.colorDarkGrey
                        : Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 12),
                    child: Center(
                      child: Text(
                        'Positive',
                        textScaleFactor: 1.1,
                        style: TextStyle(
                          color:
                          screenController.isPositiveSelected.value
                              ? Colors.white
                              : AppColors.colorDarkGrey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 10),
              child: GestureDetector(
                onTap: () {
                  screenController.isPositiveSelected.value = false;
                  screenController.isNegativeSelected.value = true;
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                    Border.all(color: AppColors.colorDarkGrey, width: 2),
                    color: screenController.isNegativeSelected.value
                        ? AppColors.colorDarkGrey
                        : Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 12),
                    child: Center(
                      child: Text(
                        'Negative',
                        textScaleFactor: 1.1,
                        style: TextStyle(
                          color:
                          screenController.isNegativeSelected.value
                              ? Colors.white
                              : AppColors.colorDarkGrey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

///Positive Point
class PositivePointModule extends StatelessWidget {
  const PositivePointModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('positive gameid : ${UserDetails.gameId}');
    return /*(int.parse(UserDetails.gameId) == 0) ?
        const Center(child: Text("First join the game")) :*/
      SingleChildScrollView(
      child: Column(
        children: [
          TrackExerciseModule(),
          //const SizedBox(height: 5),
          //TrackMovementModule(),
         // const SizedBox(height: 10),
          //TrackWaterIntakeModule(),
         // const SizedBox(height: 10),
          //TrackTimeSpendOnMindFullnessModule(),
         // const SizedBox(height: 10),
        ],
      ).commonAllSidePadding(),
    );
  }
}

///Negative Point
class NegativePointModule extends StatelessWidget {
   NegativePointModule({Key? key}) : super(key: key);
   final screenController = Get.find<TrackScreenController>();

   List<String> image = [
     AppImages.categoryDairyProductImg,
     AppImages.categoryAlcoholImg,
     AppImages.categoryPastaImg,
     AppImages.categoryPizzaImg,
     AppImages.categoryCandyImg,
     AppImages.categorySodaImg,
   ];

   List<String> categoryName = [
     "Dairy Products",
     "Alcohol",
     "Pasta",
     "Pizza",
     "Candy",
     "Soda",
   ];

  @override
  Widget build(BuildContext context) {
    return /*(int.parse(UserDetails.gameId) == 0) ?
    const Center(child: Text("First join the game")) :*/
      ListView.builder(
      itemCount: screenController.getAllNegativeCategoryList.length,
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, i) {
        //CategoryModel singleCategory = screenController.categoryList[i];
        return categoryListTile(/*singleCategory*/i)
            .commonSymmetricPadding(vertical: 8);
      },
    ).commonAllSidePadding(padding: 15);
  }

  Widget categoryListTile(/*CategoryModel singleCategory*/i) {
    return GestureDetector(
      onTap: () {
        // Get.to(
        //       () => CategoryDetailsScreen(),
        //   transition: Transition.zoom,
        //   //arguments: singleCategory,
        // );
      },
      child: Container(
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
            SizedBox(
              height: 55,
              width: 55,
              child: Image.network("https://squadgame.omdemo.co.in/asset/uploads/category/" + screenController.getAllNegativeCategoryList[i].image),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                screenController.getAllNegativeCategoryList[i].name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Column(
              children: [
                Text(
                  screenController.getAllNegativeCategoryList[i].point.toString(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 5),
                GestureDetector(
                  onTap: () {
                    screenController.addNegativeCategoryPointEntry(
                      catId: screenController.getAllNegativeCategoryList[i].id,
                      point: screenController.getAllNegativeCategoryList[i].point,
                    );

                    // screenController.loadUI();
                  },
                  child: Container(
                    // height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.colorDarkGrey,
                    ),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.add_rounded,
                          color: Colors.white,
                          size: 18,
                        ),
                        Text(
                          "Add",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ).commonSymmetricPadding(horizontal: 16, vertical: 10),
                  ),
                ),
              ],
            ),
            /*Row(
              children: [
                GestureDetector(
                  onTap: () {
                    // if (singleCategory.categoryId == "cat_id_1") {
                    //   screenController.dairyProductValue++;
                    //   log("${DateTime.now().day}${DateTime.now().month}${DateTime.now().year}${DateTime.now().hour}${DateTime.now().minute}${DateTime.now().second}${DateTime.now().millisecond}");
                    // } else if (singleCategory.categoryId == "cat_id_2") {
                    //   screenController.alcoholValue++;
                    // } else if (singleCategory.categoryId == "cat_id_3") {
                    //   screenController.pastaValue++;
                    // } else if (singleCategory.categoryId == "cat_id_4") {
                    //   screenController.pizzaValue++;
                    // } else if (singleCategory.categoryId == "cat_id_5") {
                    //   screenController.candyValue++;
                    // } else if (singleCategory.categoryId == "cat_id_6") {
                    //   screenController.sodaValue++;
                    // }

                    screenController.addCategoryPointEntryToFirebaseFunction(
                      catId: singleCategory.categoryId,
                      catName: singleCategory.categoryName,
                      point: singleCategory.categoryPoint.toDouble(),
                    );

                    screenController.loadUI();
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
                Text(
                  singleCategory.categoryId == "cat_id_1"
                      ? "${screenController.dairyProductValue.value}"
                      : singleCategory.categoryId == "cat_id_2"
                          ? "${screenController.alcoholValue.value}"
                          : singleCategory.categoryId == "cat_id_3"
                              ? "${screenController.pastaValue.value}"
                              : singleCategory.categoryId == "cat_id_4"
                                  ? "${screenController.pizzaValue.value}"
                                  : singleCategory.categoryId == "cat_id_5"
                                      ? "${screenController.candyValue.value}"
                                      : "${screenController.sodaValue.value}",
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ).commonSymmetricPadding(horizontal: 10),
                GestureDetector(
                  onTap: () {
                    if (singleCategory.categoryId == "cat_id_1") {
                      if (screenController.dairyProductValue < 1) {
                        log("dairyProductValue : ${screenController.dairyProductValue}");
                      } else {
                        screenController.dairyProductValue--;
                      }
                    } else if (singleCategory.categoryId == "cat_id_2") {
                      if (screenController.alcoholValue < 1) {
                        log("alcoholValue : ${screenController.alcoholValue}");
                      } else {
                        screenController.alcoholValue--;
                      }
                    } else if (singleCategory.categoryId == "cat_id_3") {
                      if (screenController.pastaValue < 1) {
                        log("pastaValue : ${screenController.pastaValue}");
                      } else {
                        screenController.pastaValue--;
                      }
                    } else if (singleCategory.categoryId == "cat_id_4") {
                      if (screenController.pizzaValue < 1) {
                        log("pizzaValue : ${screenController.pizzaValue}");
                      } else {
                        screenController.pizzaValue--;
                      }
                    } else if (singleCategory.categoryId == "cat_id_5") {
                      if (screenController.candyValue < 1) {
                        log("candyValue : ${screenController.candyValue}");
                      } else {
                        screenController.candyValue--;
                      }
                    } else if (singleCategory.categoryId == "cat_id_6") {
                      if (screenController.sodaValue < 1) {
                        log("sodaValue : ${screenController.sodaValue}");
                      } else {
                        screenController.sodaValue--;
                      }
                    }

                    screenController.loadUI();
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
            ),*/
          ],
        ).commonAllSidePadding(padding: 15),
      ),
    );
  }
}


/// Track Exercise
class TrackExerciseModule extends StatelessWidget {
  TrackExerciseModule({Key? key}) : super(key: key);
  final screenController = Get.find<TrackScreenController>();

  List<String> image = [
    AppImages.runningImg,
    AppImages.weightsImg,
    AppImages.boxingImg,
    AppImages.hikingImg,
    AppImages.boxingImg,
    AppImages.pilatesImg,
    AppImages.yogaImg,
    AppImages.walkingImg,
    AppImages.coachingImg,
    AppImages.weightsImg,
    AppImages.journalImg,
    AppImages.meditationImg
  ];

  List<String> fitnessName = [
    "Running",
    "Weights",
    "Boxing",
    "Hiking",
    "Fitness Class",
    "Pilates",
    "Yoga",
    "Walking",
    "Coaching Kids",
    "Stretching",
    "Journal",
    "Meditation"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(
        //   "Track Exercise",
        //   maxLines: 1,
        //   overflow: TextOverflow.ellipsis,
        //   style: TextStyle(
        //     fontWeight: FontWeight.bold,
        //     fontSize: 20,
        //   ),
        // ),
        // SizedBox(height: 5),
        /*SizedBox(
          height: 170,
          child: GridView.builder(
            itemCount: screenController.exerciseList.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: Get.width/(Get.height/1.3)
            ),
            itemBuilder: (context, i) {
              FitnessModel singleExercise = screenController.exerciseList[i];
              return _trackExerciseGridTile(singleExercise)
                  .commonSymmetricPadding(vertical: 8);
            },
          ).commonSymmetricPadding(vertical: 10),
        ),*/
        SizedBox(
          //height: Get.height/3,
          child: ListView.builder(
            shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: screenController.getAllPositiveCategoryList.length,
              itemBuilder: (context, i){
               // FitnessModel singleExercise = screenController.exerciseList[i];
                return _trackExerciseGridTile(i)
                    .commonSymmetricPadding(vertical: 3);
              }),
        )
      ],
    );
  }

  Widget _trackExerciseGridTile(/*FitnessModel singleItem*/i) {
    return GestureDetector(
      onTap: () {
        // Get.to(() => ExerciseDetailsScreen(),
        //     transition: Transition.zoom, /*arguments: singleItem*/);
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
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 55,
                height: 80,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    // image: NetworkImage(
                    //     singleItem.fitnessImage),
                    image: NetworkImage("https://squadgame.omdemo.co.in/asset/uploads/category/" +screenController.getAllPositiveCategoryList[i].image),
                    fit: BoxFit.cover,
                  ),
                ),
              ).commonSymmetricPadding(vertical: 5, horizontal: 10),
              //Image.network(singleItem.fitnessImage, fit: BoxFit.cover, height: 80, width: 70,),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  screenController.getAllPositiveCategoryList[i].name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),

              const SizedBox(width: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 // Obx(()=>
                     Text(
                      //screenController.positiveCategoryValue.value.toString(),
                       screenController.getAllPositiveCategoryList[i].point.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                 // ),
                  const SizedBox(height: 5,),
                  GestureDetector(
                    onTap: () async {
                      // if (screenController.positiveCategoryValue.value <= 0) {
                      // screenController.positiveCategoryValue++;
                      // log("${screenController.positiveCategoryValue}");
                      // screenController.addCategoryPointEntry();
                      // }

                    //   screenController.addCategoryPointEntry(
                    //   // catId: singleCategory.categoryId,
                    //   // catName: singleCategory.categoryName,
                    //   // point: singleCategory.categoryPoint.toDouble(),
                    // );

                      // screenController.addPositiveCategoryPointEntry(
                      //   catId: screenController.getAllPositiveCategoryList[i].id,
                      //   point: screenController.getAllPositiveCategoryList[i].point,
                      // );

                      if(screenController.getAllPositiveCategoryList[i].id == 20){
                        log("water intake Point Add API");
                        await screenController.addWaterIntakeCategoryPointEntry(
                          catId: screenController.getAllPositiveCategoryList[i].id,
                          point: screenController.getAllPositiveCategoryList[i].point,
                        );
                      } else{
                        log("Positive Point Add API");
                        await screenController.addPositiveCategoryPointEntry(
                          catId: screenController.getAllPositiveCategoryList[i].id,
                          point: screenController.getAllPositiveCategoryList[i].point,
                        );
                      }
                    },
                    child: Container(
                      // height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.colorDarkGrey,
                      ),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.add_rounded,
                            color: Colors.white,
                            size: 18,
                          ),
                          Text(
                            "Add",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ).commonSymmetricPadding(horizontal: 16, vertical: 10),
                    ),
                  ),
                ],
              )

            ],
          ),
        ),
      ).commonAllSidePadding(padding: 5),
    );
  }
}

/// Track Movement
class TrackMovementModule extends StatelessWidget {
  TrackMovementModule({Key? key}) : super(key: key);
  final screenController = Get.find<TrackScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // const Text(
        //   "Track Movement",
        //   maxLines: 1,
        //   overflow: TextOverflow.ellipsis,
        //   style: TextStyle(
        //     fontWeight: FontWeight.bold,
        //     fontSize: 20,
        //   ),
        // ),
        /*SizedBox(
          height: 170,
          child: GridView.builder(
            itemCount: screenController.movementList.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
                childAspectRatio: Get.width/(Get.height/1.3)
            ),
            itemBuilder: (context, i) {
              FitnessModel singleMovement = screenController.movementList[i];
              return _trackMovementGridTile(singleMovement)
                  .commonSymmetricPadding(vertical: 8);
            },
          ).commonSymmetricPadding(vertical: 10),
        ),*/
        SizedBox(
          //height: Get.height/3,
          child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: screenController.movementList.length,
              itemBuilder: (context, i){
                FitnessModel singleMovement = screenController.movementList[i];
                return _trackMovementGridTile(singleMovement)
                    .commonSymmetricPadding(vertical: 5);
              }),
        )
      ],
    );
  }

  Widget _trackMovementGridTile(FitnessModel singleItem) {
    return GestureDetector(
      onTap: (){
        Get.to(() => ExerciseDetailsScreen(),
            transition: Transition.zoom, arguments: singleItem);
      },
      child: Container(
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
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 55,
                height: 80,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        singleItem.fitnessImage),
                    //fit: BoxFit.cover,
                  ),
                ),
              ).commonSymmetricPadding(vertical: 10, horizontal: 10),
              //Image.network(singleItem.fitnessImage, fit: BoxFit.cover, height: 80, width: 70,),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  singleItem.fitnessName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),

              const SizedBox(width: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "0",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Container(
                    // height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.colorDarkGrey,
                    ),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.add_rounded,
                          color: Colors.white,
                          size: 18,
                        ),
                        Text(
                          "Add",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ).commonSymmetricPadding(horizontal: 16, vertical: 10),
                  ),
                ],
              )

            ],
          ),
        ),
      ).commonAllSidePadding(padding: 5),
    );
  }
}

/// Track Water Intake
class TrackWaterIntakeModule extends StatelessWidget {
  TrackWaterIntakeModule({Key? key}) : super(key: key);
  final screenController = Get.find<TrackScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // const Text(
        //   "Track Water Intake",
        //   maxLines: 1,
        //   overflow: TextOverflow.ellipsis,
        //   style: TextStyle(
        //     fontWeight: FontWeight.bold,
        //     fontSize: 20,
        //   ),
        // ),

        GestureDetector(
          onTap: () {
            // Get.to(() => WaterIntakeDetailsScreen(),
            //     //arguments: screenController.waterIntakeList[0]
            //     transition: Transition.zoom);

          },
          child: Container(
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
                      image: AssetImage(AppImages.glassImg),
                      // image: NetworkImage(
                      //     screenController.waterIntakeList[0].waterIntakeImage),
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
                        "Water",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Glasses",
                        style: const TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                /*Row(
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
                ),*/

                Column(
                  children: [
                    Obx(
                      () => Text(
                        "${screenController.waterIntakeValue.value}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ).commonSymmetricPadding(horizontal: 10),
                    ),
                    const SizedBox(height: 10),

                    GestureDetector(
                      onTap: () async {
                        /*if (screenController.waterIntakeValue.value < 4) {
                          screenController.waterIntakeValue++;
                          log("${screenController.waterIntakeValue}");
                          if (screenController.waterIntakeValue.value == 4) {
                            Fluttertoast.showToast(msg: "Drink 1 Gallon water!");
                            await screenController.addWaterIntakeRecordInFirebaseFunction();
                            screenController.waterIntakeValue.value = 0;
                          }
                        }*/
                      },
                      child: Container(
                        // height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.colorDarkGrey,
                        ),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.add_rounded,
                              color: Colors.white,
                              size: 18,
                            ),
                            Text(
                              "Add 1 Glass",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ).commonSymmetricPadding(horizontal: 16, vertical: 10),
                      ),
                    ),
                  ],
                ),
              ],
            ).commonAllSidePadding(padding: 15),
          ).commonAllSidePadding(),
        ),

        // Container(
        //   width: Get.width,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(10),
        //     boxShadow: [
        //       BoxShadow(
        //         blurRadius: 6,
        //         blurStyle: BlurStyle.outer,
        //         color: AppColors.colorLightGrey,
        //       ),
        //     ],
        //   ),
        //   child: Row(
        //     children: [
        //
        //       Container(
        //         width: 38,
        //         height: 50,
        //         decoration: const BoxDecoration(
        //           image: DecorationImage(
        //             image: AssetImage(AppImages.glassImg),
        //             fit: BoxFit.cover,
        //           ),
        //         ),
        //       ).commonSymmetricPadding(vertical: 10, horizontal: 10),
        //       const SizedBox(width: 10),
        //       Expanded(
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //           children: const [
        //             Text(
        //               "Water",
        //               style: TextStyle(
        //                 fontWeight: FontWeight.bold,
        //                 fontSize: 17,
        //               ),
        //             ),
        //             SizedBox(height: 10),
        //             Text(
        //               "Glasses",
        //               style: TextStyle(
        //                 // fontWeight: FontWeight.bold,
        //                 fontSize: 14,
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //       const SizedBox(width: 10),
        //       Row(
        //         children: [
        //           GestureDetector(
        //             onTap: () {
        //               screenController.waterIntakeValue.value++;
        //             },
        //             child: Container(
        //               decoration: BoxDecoration(
        //                 borderRadius: BorderRadius.circular(10),
        //                 color: AppColors.colorDarkGrey,
        //               ),
        //               child: Center(
        //                 child: const Icon(
        //                     Icons.add_rounded,
        //                   color: Colors.white,
        //                   size: 18,
        //                 ).commonAllSidePadding(padding: 8),
        //               ),
        //             ),
        //           ),
        //
        //           Obx(
        //             ()=> Text(
        //                 "${screenController.waterIntakeValue.value}",
        //               style: const TextStyle(
        //                 fontSize: 16,
        //               ),
        //             ).commonSymmetricPadding(horizontal: 10),
        //           ),
        //
        //           GestureDetector(
        //             onTap: () {
        //               if(screenController.waterIntakeValue.value < 1) {
        //                 log("Value ${screenController.waterIntakeValue.value}");
        //               } else {
        //                 screenController.waterIntakeValue.value--;
        //               }
        //
        //             },
        //             child: Container(
        //               decoration: BoxDecoration(
        //                 borderRadius: BorderRadius.circular(10),
        //                 color: AppColors.colorDarkGrey,
        //               ),
        //               child: Center(
        //                 child: const Icon(
        //                   Icons.remove_rounded,
        //                   color: Colors.white,
        //                   size: 18,
        //                 ).commonAllSidePadding(padding: 8),
        //               ),
        //             ),
        //           ),
        //
        //         ],
        //       ),
        //     ],
        //   ).commonAllSidePadding(padding: 15),
        // ).commonAllSidePadding(),
      ],
    );
  }
}

/// Track Time Spend on Mindfulness
class TrackTimeSpendOnMindFullnessModule extends StatelessWidget {
  TrackTimeSpendOnMindFullnessModule({Key? key}) : super(key: key);
  final screenController = Get.find<TrackScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // const Text(
        //   "Track Time Spend on Mindfulness",
        //   maxLines: 1,
        //   overflow: TextOverflow.ellipsis,
        //   style: TextStyle(
        //     fontWeight: FontWeight.bold,
        //     fontSize: 20,
        //   ),
        // ),
        // SizedBox(height: 5),
        /*SizedBox(
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
            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
                childAspectRatio: Get.width/(Get.height/1.3)
            ),
            itemBuilder: (context, i) {
              FitnessModel singleItem = screenController.mindfulnessList[i];
              return _trackTimeSpendOnMindFullnessGridTile(singleItem);
            },
          ).commonSymmetricPadding(vertical: 10),
        ),*/
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount:  screenController.mindfulnessList.length,
            itemBuilder: (context, i){
              FitnessModel singleItem = screenController.mindfulnessList[i];
              return _trackTimeSpendOnMindFullnessGridTile(singleItem);
            }),
      ],
    );
  }

  Widget _trackTimeSpendOnMindFullnessGridTile(FitnessModel singleItem) {
    return GestureDetector(
      onTap: (){
        Get.to(() => ExerciseDetailsScreen(),
            transition: Transition.zoom, arguments: singleItem);
      },
      child: Container(
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
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 55,
                height: 80,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        singleItem.fitnessImage),
                    //fit: BoxFit.cover,
                  ),
                ),
              ).commonSymmetricPadding(vertical: 10, horizontal: 10),
              //Image.network(singleItem.fitnessImage, fit: BoxFit.cover, height: 80, width: 70,),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  singleItem.fitnessName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),

              const SizedBox(width: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "0",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Container(
                    // height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.colorDarkGrey,
                    ),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.add_rounded,
                          color: Colors.white,
                          size: 18,
                        ),
                        Text(
                          "Add",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ).commonSymmetricPadding(horizontal: 16, vertical: 10),
                  ),
                ],
              )

            ],
          ),
        )
      ).commonAllSidePadding(padding: 7),
    );
  }
}

