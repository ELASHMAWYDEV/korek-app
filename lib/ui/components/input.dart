import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:korek_app/utils/constants.dart';

class Input extends StatelessWidget {
  const Input({
    super.key,
    this.inputFormatters,
    required this.placeholder,
    this.controller,
    this.starting,
    this.ending,
    this.isReadOnly = false,
    this.onTap,
  });

  final List<TextInputFormatter>? inputFormatters;
  final String? placeholder;
  final TextEditingController? controller;
  final Widget? starting;
  final Widget? ending;
  final bool isReadOnly;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          border: Border.all(color: kBlackColor.withOpacity(0.1)),
        ),
        child: Row(
          children: [
            if (starting != null) starting!,
            Expanded(
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.phone,
                inputFormatters: inputFormatters,
                readOnly: isReadOnly,
                decoration: InputDecoration(
                    hintText: placeholder,
                    hintStyle:
                        const TextStyle(fontSize: 16, color: kGrayLightColor),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 22, vertical: 0)),
              ),
            ),
            if (ending != null) ending!,
          ],
        ),
      ),
    );
  }
}
