import 'package:flutter/material.dart';
import 'package:friend_fitness_app/common/constants/app_colors.dart';
import 'package:friend_fitness_app/common/extension_methods/extension_methods.dart';
import 'package:friend_fitness_app/common/user_details.dart';
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
    return RefreshIndicator(
      onRefresh: (){
        return Future.delayed(
            const Duration(seconds: 1),(){
          screenController.getAllUserWisePointApi();
        });
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: (int.parse(UserDetails.gameId) == 0) ?
        const Text("Please join with any game"):

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
             Text("Date:" + screenController.currentDate, style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),),
             const SizedBox(height: 10),
            positivePointModule(),

            const SizedBox(height: 10),
            negativePointModule(),

            // const SizedBox(height: 10),
            // showStarPointModule(),

            //const SizedBox(height: 250),

            // const SizedBox(height: 10),
            // negativePointModule(),
            // const SizedBox(height: 10),
            // negativePointModule(),
            // const SizedBox(height: 10),
            // negativePointModule(),
            // const SizedBox(height: 10),
            // negativePointModule(),
            // const SizedBox(height: 10),
            // negativePointModule(),
          ],
        ),
      ),
    );
  }

  positivePointModule(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Positive Points:", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
        const SizedBox(height: 10),
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
            /*child: Column(
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
            ),*/
            child: Column(
              children: [
                screenController.getUserWisePositivePointList.isEmpty ?
                    const Center(child: Text("No Positive Points")) :
                ListView.builder(
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: screenController.getUserWisePositivePointList.length,
                    itemBuilder: (context, index){
                        return gameSummaryListTile(index).commonSymmetricPadding(vertical: 5, horizontal: 5);
                     /* return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(screenController.getUserWisePositivePointList[index].categoryname),
                            Text(screenController.getUserWisePositivePointList[index].point.toString())
                          ],
                        ),
                      );*/
                    }),
                const Divider(thickness: 2.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Total:"),
                    Text(screenController.totalPositivePoint.toString())
                  ],
                ),
              ],
            ),
          ),
        )

      ],
    );
  }

  Widget gameSummaryListTile(index){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(screenController.getUserWisePositivePointList[index].categoryname),
        Text(screenController.getUserWisePositivePointList[index].point.toString())
      ],
    );
  }

  negativePointModule(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Negative Points:", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
        const SizedBox(height: 10),
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
                screenController.getUserWiseNegativePointList.isEmpty ?
                const Center(child: Text("No Negative Points")) :
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: screenController.getUserWiseNegativePointList.length,
                    itemBuilder: (context, index){
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(screenController.getUserWiseNegativePointList[index].categoryname),
                            Text(screenController.getUserWiseNegativePointList[index].point.toString())
                          ],
                        ),
                      );
                    }),
                const Divider(thickness: 2.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Total:"),
                    Text(screenController.totalNegativePoint.toString())
                  ],
                ),
              ],
            ),
          ),
        )

      ],
    );
  }

  showStarPointModule(){
    return screenController.getUserWiseNegativePointList.isEmpty && screenController.getUserWisePositivePointList.isNotEmpty?
        Icon(Icons.star) : Container();
  }
}

