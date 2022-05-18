import 'package:flutter/material.dart';
import 'package:friend_fitness_app/common/constants/app_colors.dart';
import 'package:friend_fitness_app/controllers/game_summary_details_screen_controller/game_summary_details_screen_controller.dart';
import 'package:get/get.dart';

/// AppBar
class GameSummaryDetailsScreenAppBarModule extends StatelessWidget {
  const GameSummaryDetailsScreenAppBarModule({Key? key}) : super(key: key);

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
            "Game Summary",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Container(),
        ],
      ),
    );
  }
}

class GameSummaryDetailsModule extends StatelessWidget {
  GameSummaryDetailsModule({Key? key}) : super(key: key);

  final screenController = Get.find<GameSummaryDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Date: 14-05-2022", style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),),
        SizedBox(height: 10),
        positivePointModule(),

        SizedBox(height: 10),
        negativePointModule()
      ],
    );
  }

  positivePointModule(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Positive Points:", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
        SizedBox(height: 10),
        Container(
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
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Exercise"),
                    Text("2")
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Movement"),
                    Text("1")
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Water"),
                    Text("1")
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Mindfulness"),
                    Text("1")
                  ],
                ),
                Divider(thickness: 2.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total:"),
                    Text("5")
                  ],
                ),
              ],
            ),
          ),
        )

      ],
    );
  }

  negativePointModule(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Negative Points:", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
        SizedBox(height: 10),
        Container(
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
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Dairy Product"),
                    Text("2")
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Alcohol"),
                    Text("1")
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Pasta"),
                    Text("1")
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Pizza"),
                    Text("1")
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Candy"),
                    Text("1")
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Soda"),
                    Text("1")
                  ],
                ),
                Divider(thickness: 2.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total:"),
                    Text("7")
                  ],
                ),
              ],
            ),
          ),
        )

      ],
    );
  }
}

