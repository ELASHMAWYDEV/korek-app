import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:korek_app/ui/components/input.dart';
import 'package:korek_app/ui/components/main_button.dart';
import 'package:korek_app/ui/components/phone_number_input.dart';
import 'package:korek_app/ui/controllers/register_controller.dart';
import 'package:korek_app/utils/constants.dart';

class FirstStep extends StatelessWidget {
  FirstStep({super.key});

  final RegisterController _ = Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.65,
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Input(placeholder: "Full Name", controller: _.nameInputController),
          const SizedBox(height: 15),
          Input(
            placeholder: "Email",
            controller: _.emailInputController,
          ),
          const SizedBox(height: 15),
          Input(
            placeholder: "Password",
            controller: _.passwordInputController,
            obscureText: true,
          ),
          const SizedBox(height: 15),
          PhoneNumberInput(controller: _.phoneInputController),
          const SizedBox(height: 30),
          MainButton(
            onPressed: () {
              _.currentStep += 1;
              _.update();
            },
            text: "Next",
            isActive: _.nameInputController.text != "" &&
                _.emailInputController.text != "" &&
                _.passwordInputController.text != "" &&
                _.phoneInputController.text != "",
          ),
        ],
      ),
    );
  }
}
