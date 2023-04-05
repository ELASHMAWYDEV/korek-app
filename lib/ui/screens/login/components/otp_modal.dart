import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:korek_app/ui/components/main_button.dart';
import 'package:korek_app/ui/controllers/login_controller.dart';
import 'package:korek_app/utils/constants.dart';

class OtpModal extends StatelessWidget {
  const OtpModal({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (_) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: FittedBox(
          child: Column(children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: const Text(
                "Please insert the OTP\nwe sent to your phone",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 50,
                    child: TextField(
                      textInputAction: TextInputAction.previous,
                      controller: _.otp1InputController,
                      inputFormatters: [LengthLimitingTextInputFormatter(1)],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: kBlackColor.withOpacity(0.1))),
                        hintText: "0",
                        hintStyle: const TextStyle(color: kGrayLightColor),
                        contentPadding: const EdgeInsets.all(20),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  SizedBox(
                    width: 50,
                    child: TextField(
                      textInputAction: TextInputAction.next,
                      controller: _.otp2InputController,
                      inputFormatters: [LengthLimitingTextInputFormatter(1)],
                      decoration: InputDecoration(
                        focusColor: kBlackColor,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: kBlackColor.withOpacity(0.1))),
                        hintText: "0",
                        hintStyle: const TextStyle(color: kGrayLightColor),
                        contentPadding: const EdgeInsets.all(20),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  SizedBox(
                    width: 50,
                    child: TextField(
                      textInputAction: TextInputAction.next,
                      controller: _.otp3InputController,
                      inputFormatters: [LengthLimitingTextInputFormatter(1)],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: kBlackColor.withOpacity(0.1))),
                        hintText: "0",
                        hintStyle: const TextStyle(color: kGrayLightColor),
                        contentPadding: const EdgeInsets.all(20),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  SizedBox(
                    width: 50,
                    child: TextField(
                      textInputAction: TextInputAction.done,
                      controller: _.otp4InputController,
                      inputFormatters: [LengthLimitingTextInputFormatter(1)],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: kBlackColor.withOpacity(0.1))),
                        hintText: "0",
                        hintStyle: const TextStyle(color: kGrayLightColor),
                        contentPadding: const EdgeInsets.all(20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Didn't get it?",
                  style: TextStyle(color: kBlackColor, fontSize: 12),
                ),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Text(
                      "Resend",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ]),
        ),
      );
    });
  }
}
