import 'package:flutter/material.dart';
import 'package:friend_fitness_app/common/constants/app_colors.dart';
import 'package:friend_fitness_app/common/extension_methods/extension_methods.dart';
import 'package:friend_fitness_app/common/field_validation.dart';
import 'package:friend_fitness_app/controllers/create_game_screen_controller/create_game_screen_controller.dart';
import 'package:get/get.dart';

class CreateGameScreenAppBarModule extends StatelessWidget {
  const CreateGameScreenAppBarModule({Key? key}) : super(key: key);

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
                  Icons.arrow_back
              ),
            ),
          ),
          const Text(
            "Create Game",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Container(width: 42,
              height: 42),
        ],
      ),
    );
  }
}

/// Name Text Field
class NameTextFieldModule extends StatelessWidget {
  NameTextFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<CreateGameScreenController>();
  final FieldValidator fieldValidator = FieldValidator();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                blurRadius: 6,
                blurStyle: BlurStyle.outer,
                color: AppColors.colorLightGrey,
              ),
            ],
          ),
        ),

        TextFormField(
          controller: screenController.nameFieldController,
          keyboardType: TextInputType.text,
          cursorColor: Colors.grey,
          decoration: createGameInputDecoration(hintText: "Name"),
          validator: (value) => fieldValidator.validateName(value!),
        ),

      ],
    );
  }
}

/// Days Text Field
class DaysTextFieldModule extends StatelessWidget {
   DaysTextFieldModule({Key? key}) : super(key: key);
  final FieldValidator fieldValidator = FieldValidator();
   final screenController = Get.find<CreateGameScreenController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                blurRadius: 6,
                blurStyle: BlurStyle.outer,
                color: AppColors.colorLightGrey,
              ),
            ],
          ),
        ),

        TextFormField(
          controller: screenController.dayFieldController,
          keyboardType: TextInputType.text,
          cursorColor: Colors.grey,
          decoration: createGameInputDecoration(hintText: "Day"),
          validator: (value) => fieldValidator.validateDay(value!),
        ),

      ],
    );
  }
}

/// Person TextField
class PersonTextFieldModule extends StatelessWidget {
  PersonTextFieldModule({Key? key}) : super(key: key);
  final FieldValidator fieldValidator = FieldValidator();
  final screenController = Get.find<CreateGameScreenController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                blurRadius: 6,
                blurStyle: BlurStyle.outer,
                color: AppColors.colorLightGrey,
              ),
            ],
          ),
        ),

        TextFormField(
          controller: screenController.personFieldController,
          keyboardType: TextInputType.text,
          cursorColor: Colors.grey,
          decoration: createGameInputDecoration(hintText: "Person"),
          validator: (value) => fieldValidator.validatePerson(value!),
        ),

      ],
    );
  }
}

/// Amount TextField
class AmountTextFieldModule extends StatelessWidget {
  AmountTextFieldModule({Key? key}) : super(key: key);
  final FieldValidator fieldValidator = FieldValidator();
  final screenController = Get.find<CreateGameScreenController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                blurRadius: 6,
                blurStyle: BlurStyle.outer,
                color: AppColors.colorLightGrey,
              ),
            ],
          ),
        ),

        TextFormField(
          controller: screenController.amountFieldController,
          keyboardType: TextInputType.text,
          cursorColor: Colors.grey,
          decoration: createGameInputDecoration(hintText: "Amount"),
          validator: (value) => fieldValidator.validateAmount(value!),
        ),

      ],
    );
  }
}

/// Reward Points TextField
class RewardPointsTextFieldModule extends StatelessWidget {
  RewardPointsTextFieldModule({Key? key}) : super(key: key);
  final FieldValidator fieldValidator = FieldValidator();
  final screenController = Get.find<CreateGameScreenController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                blurRadius: 6,
                blurStyle: BlurStyle.outer,
                color: AppColors.colorLightGrey,
              ),
            ],
          ),
        ),

        TextFormField(
          controller: screenController.rewardPointFieldController,
          keyboardType: TextInputType.text,
          cursorColor: Colors.grey,
          decoration: createGameInputDecoration(hintText: "Reward Point"),
          validator: (value) => fieldValidator.validateRewardPoint(value!),
        ),

      ],
    );
  }
}

/// Select day Drop Down Module
class SelectDayDropDownModule extends StatelessWidget {
  SelectDayDropDownModule({Key? key}) : super(key: key);
  final screenController = Get.find<CreateGameScreenController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            //border: Border.all(color: AppColors.colorLightGrey),
            boxShadow: [
              BoxShadow(
                color: AppColors.colorLightGrey,
                blurRadius: 5,
                //spreadRadius: 5,
                blurStyle: BlurStyle.outer,
              ),
            ],
          ),
        ),

        Obx(() =>
            Container(
              padding: const EdgeInsets.only(left: 10),
              width: Get.width, //gives the width of the dropdown button
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
              ),
              child: Theme(
                data: Theme.of(context).copyWith(
                  //canvasColor: Colors.grey.shade100,
                  buttonTheme: ButtonTheme.of(context).copyWith(
                    alignedDropdown: true,
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(

                    value: screenController.weekDayValue.value.toString(),

                    items: <String>[
                      'Sunday',
                      'Monday',
                      'Tuesday',
                      'Wednesday',
                      'Thursday',
                      'Friday',
                      'Saturday'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.grey),
                        ),
                      );
                    }).toList(),

                    onChanged: (value){
                      screenController.isLoading(true);
                      screenController.weekDayValue.value = value!;
                      screenController.isLoading(false);
                    },
                  ),
                ),
              ),
            ),
        ),
      ],
    );
  }
}


/// Create game Button Module
class CreateGameButtonModule extends StatelessWidget {
  CreateGameButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<CreateGameScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            if (screenController.createGameFormKey.currentState!.validate()) {
              //Get.offAll(()=> HomeScreen(), transition: Transition.zoom);
              screenController.createGameFunction();
           }
          },
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.colorDarkGrey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              "Create",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
              ),
            ).commonSymmetricPadding(horizontal: 30, vertical: 14),
          ),
        ),
      ],
    );
  }
}




/// Create Game Fields Decoration
InputDecoration createGameInputDecoration(
    {required String hintText,
      int index = 0,}) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: const TextStyle(color: Colors.grey),
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
    filled: true,
    fillColor: Colors.white,
    counterText: "",
    enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Colors.grey.shade200)),
    focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Colors.grey.shade200)),
    errorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Colors.grey.shade200)),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Colors.grey.shade200)),
  );
}
