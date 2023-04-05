import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:korek_app/ui/components/main_button.dart';
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
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  border: Border.all(color: kBlackColor.withOpacity(0.1)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border(
                            right: BorderSide(
                                color: kBlackColor.withOpacity(0.1), width: 1)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/egypt-circle.png",
                            height: 20,
                          ),
                          const SizedBox(width: 5),
                          const Text("+20",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: TextField(
                        controller: _.phoneInputController,
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(11),
                        ],
                        decoration: const InputDecoration(
                            hintText: "0100 234 1243",
                            hintStyle:
                                TextStyle(fontSize: 16, color: kGrayLightColor),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 22, vertical: 0)),
                      ),
                    ),
                  ],
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
                        Get.offAllNamed("/signup");
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
