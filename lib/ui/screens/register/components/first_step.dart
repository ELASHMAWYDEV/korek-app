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
              placeholder: "Date of Birth",
              controller: _.dobInputController,
              isReadOnly: true,
              ending: const Padding(
                padding: EdgeInsets.only(right: 12.0),
                child: Icon(Icons.calendar_month, color: Colors.grey, size: 24),
              ),
              onTap: () {
                showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                    currentDate: DateTime.now(),
                    builder: (BuildContext context, Widget? child) {
                      return Theme(
                        data: ThemeData.light().copyWith(
                          colorScheme: const ColorScheme.light(
                            primary: kPrimaryColor,
                            onPrimary: Colors.white,
                            surface: kPrimaryColor,
                            onSurface: Colors.black,
                          ),
                          dialogBackgroundColor: Colors.white,
                        ),
                        child: child!,
                      );
                    }).then((value) {
                  if (value != null) {
                    _.dobInputController.text =
                        "${value.day}/${value.month}/${value.year}";
                  }
                });
              }),
          const SizedBox(height: 15),
          Input(placeholder: "Address", controller: _.addressInputController),
          const SizedBox(height: 15),
          PhoneNumberInput(controller: _.phoneInputController),
          const SizedBox(height: 30),
          MainButton(
            onPressed: () {
              _.currentStep += 1;
              _.update();
            },
            text: "Verify My Number",
            isActive: _.nameInputController.text != "" &&
                _.dobInputController.text != "" &&
                _.addressInputController.text != "" &&
                _.phoneInputController.text != "",
          ),
        ],
      ),
    );
  }
}
