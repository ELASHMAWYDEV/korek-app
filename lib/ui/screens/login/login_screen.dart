import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:korek_app/ui/components/main_button.dart';
import 'package:korek_app/ui/components/phone_number_input.dart';
import 'package:korek_app/ui/controllers/login_controller.dart';
import 'package:korek_app/ui/screens/login/components/otp_modal.dart';
import 'package:korek_app/utils/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (_) {
      return Scaffold(
        body: Container(
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
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: PhoneNumberInput(
                  controller: _.phoneInputController,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Please insert your phone number to login",
                  style: TextStyle(
                    fontSize: 12,
                  )),
              const SizedBox(height: 30),
              MainButton(
                  onPressed: () {
                    Get.dialog(const OtpModal());
                  },
                  isActive: _.phoneInputController.text.length == 11,
                  text: "Login"),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(color: kBlackColor, fontSize: 12),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.offAllNamed("/register");
                      },
                      child: const Text(
                        "Signup",
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
