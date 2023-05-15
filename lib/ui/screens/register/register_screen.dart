import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:korek_app/ui/components/input.dart';
import 'package:korek_app/ui/components/phone_number_input.dart';
import 'package:korek_app/ui/controllers/register_controller.dart';
import 'package:korek_app/ui/screens/register/components/second_step.dart';
import 'package:korek_app/utils/constants.dart';

import 'components/first_step.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterController controller = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(builder: (_) {
      return Scaffold(
        body: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).padding.top + 10),
          child: Column(
            children: [
              Center(
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child:
                        Image.asset("assets/images/logo-nobg.png", height: 70)),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Stepper(
                      type: StepperType.horizontal,
                      controlsBuilder: (context, details) => Container(),
                      currentStep: _.currentStep,
                      onStepTapped: (step) {
                        _.currentStep = step;
                        _.update();
                      },
                      steps: [
                        Step(
                            title: const Text("Personal Info"),
                            content: FirstStep(),
                            isActive: _.currentStep == 0,
                            state: _.currentStep == 0
                                ? StepState.editing
                                : StepState.disabled),
                        Step(
                            title: const Text("Car Info"),
                            content: SecondStep(),
                            isActive: _.currentStep == 1,
                            state: _.currentStep == 1
                                ? StepState.editing
                                : StepState.disabled),
                      ]),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(color: kBlackColor, fontSize: 12),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.offAllNamed("/login");
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      );
    });
  }
}
