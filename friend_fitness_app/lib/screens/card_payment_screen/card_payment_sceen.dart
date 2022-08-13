import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:friend_fitness_app/common/extension_methods/extension_methods.dart';
import 'package:friend_fitness_app/controllers/card_payment_sceen_controller/card_payment_sceen_controller.dart';
import 'package:get/get.dart';

import '../../common/common_dialogs/alert_dialog.dart';

class CardPaymentScreen extends StatefulWidget {
  const CardPaymentScreen({Key? key}) : super(key: key);

  @override
  State<CardPaymentScreen> createState() => _CardPaymentScreenState();
}

class _CardPaymentScreenState extends State<CardPaymentScreen> {
  final cardScreenController = Get.put(CardPaymentScreenController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return const CustomAlertDialog();
          },
        );
        return shouldPop!;
      },
      child: Scaffold(
        body: Obx(
          () => cardScreenController.isLoading.value
              ? const CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.grey,
                )
              : SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customAppbar(),
                        const SizedBox(
                          height: 20,
                        ),
                        showPaymentSummaryWidget(context),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  showPaymentSummaryWidget(BuildContext context) {
    var bookPrice = int.parse(cardScreenController.bookingPrice);
    int adminPrice = cardScreenController.calculateAdminCharges(bookPrice);
    int userPrice = bookPrice - adminPrice;

    // int adminCharges =
    //     cardScreenController.calculateAdminCharges(bookPrice.toInt());

    // int userAmountToPay = bookPrice.toInt() - adminCharges;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Payment Summary",
          style: TextStyle(
            // color: AppColors.blackColor,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "General Inspection",
              style: TextStyle(
                // color: AppColors.colorGreyIconLight,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "\$ $userPrice",
              style: const TextStyle(
                // color: AppColors.colorGreyIconLight,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        // UserDetails.roleName == "Customer"
        //     ? Padding(
        //         padding: const EdgeInsets.only(top: 8),
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             const Text(
        //               "Administrative Charges ",
        //               style: TextStyle(
        //                 // color: AppColors.colorGreyIconLight,
        //                 fontSize: 16,
        //                 fontWeight: FontWeight.w500,
        //               ),
        //             ),
        //             Text(
        //               "\$ $adminPrice",
        //               style: const TextStyle(
        //                 // color: AppColors.colorGreyIconLight,
        //                 fontSize: 16,
        //                 fontWeight: FontWeight.w500,
        //               ),
        //             ),
        //           ],
        //         ),
        //       )
        //     : const SizedBox(),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Total ",
              style: TextStyle(
                // color: AppColors.blackColor,
                fontSize: 19,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "\$ ${bookPrice.toString()}",
              style: const TextStyle(
                // color: AppColors.blackColor,
                fontSize: 19,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Divider(),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () async {
            var uPrice = userPrice * 100;
            var aPrice = adminPrice * 100;

            log("user price : ${uPrice}");
            log("admin price : ${aPrice}");
            cardScreenController.isLoading(true);
            await cardScreenController.initPaymentSheet(
              context: context,
              adminFeesAmount: aPrice,
              userPayingAmount: uPrice,
            );
          },
          child: const Text("Procedd to Pay"),
          style: ElevatedButton.styleFrom(
              // primary: AppColors.accentColor,
              fixedSize: Size(Get.size.width, 50),
              textStyle: const TextStyle(
                // color: AppColors.whiteColor,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              )),
        ),
      ],
    ).commonSymmetricPadding(horizontal: 20, vertical: 10);
  }

  customAppbar() {
    return Container(
      height: 55,
      width: Get.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)),
        color: Colors.grey,
        //color: Colors.grey
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            leftSideButton(),
            Row(
              children: const [
                Text(
                  "Payment",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    // color: AppColors.blackColor,
                  ),
                ),
              ],
            ),
            rightSideButton(),
          ],
        ),
      ),
    );
  }

  Widget leftSideButton() {
    return GestureDetector(
      onTap: () => showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return const CustomAlertDialog();
        },
      ),
      child: const SizedBox(
        height: 50,
        width: 50,
        child: Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }

  Widget rightSideButton() {
    return const SizedBox(
      height: 50,
      width: 50,
    );
  }
}
