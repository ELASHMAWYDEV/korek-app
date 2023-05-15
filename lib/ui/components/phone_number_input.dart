import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:korek_app/ui/components/input.dart';
import 'package:korek_app/utils/constants.dart';

class PhoneNumberInput extends StatelessWidget {
  const PhoneNumberInput({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Input(
      placeholder: "0100 234 1243",
      controller: controller,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(11),
      ],
      starting: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          border: Border(
              right: BorderSide(color: kBlackColor.withOpacity(0.1), width: 1)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/egypt-circle.png",
              height: 20,
            ),
            const SizedBox(width: 5),
            const Text("+2",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
