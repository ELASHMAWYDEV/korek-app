import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:korek_app/ui/components/input.dart';
import 'package:korek_app/ui/components/main_button.dart';
import 'package:korek_app/ui/components/phone_number_input.dart';
import 'package:korek_app/ui/components/select.dart';
import 'package:korek_app/ui/controllers/register_controller.dart';
import 'package:korek_app/utils/constants.dart';

class SecondStep extends StatelessWidget {
  SecondStep({super.key});

  final RegisterController _ = Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Select(
            placeholder: "Brand",
            onChanged: (value) {
              _.brand = value;
              _.update();
            },
            value: _.brand,
            items: const [
              {"value": "kia", "label": "Kia"},
              {"value": "toyota", "label": "Toyota"}
            ]),
        const SizedBox(height: 15),
        Select(
          placeholder: "Model",
          onChanged: (value) {
            _.model = value;
            _.update();
          },
          value: _.model,
          items: const [
            {"value": "cerato", "label": "Cerato"},
            {"value": "pecanto", "label": "Pecanto"}
          ],
        ),
        const SizedBox(height: 15),
        Select(
            placeholder: "Year",
            onChanged: (value) {
              _.year = value;
              _.update();
            },
            value: _.year,
            items: const [
              {"value": "2020", "label": "2020"},
              {"value": "2021", "label": "2021"}
            ]),
        const SizedBox(height: 15),
        Input(
            placeholder: "Plate Number",
            controller: _.plateNumberInputController),
        const SizedBox(height: 15),
        Input(
            placeholder: "Chassis Number",
            controller: _.chassisNumberInputController),
        const SizedBox(
          height: 30,
        ),
        MainButton(
          onPressed: () {
            Get.offAllNamed("/home");
          },
          text: "Register My Car",
          isActive: _.brand != null &&
              _.model != null &&
              _.year != null &&
              _.plateNumberInputController.text.isNotEmpty &&
              _.chassisNumberInputController.text.isNotEmpty,
        )
      ],
    );
  }
}
