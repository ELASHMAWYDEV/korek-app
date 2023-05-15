import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:korek_app/utils/constants.dart';

class Select extends StatelessWidget {
  const Select({
    super.key,
    required this.placeholder,
    required this.onChanged,
    required this.items,
    required this.value,
  });

  final String placeholder;
  final Function(dynamic)? onChanged;
  final List<dynamic> items;
  final dynamic value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 50,
        padding: const EdgeInsets.only(left: 22, right: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          border: Border.all(color: kBlackColor.withOpacity(0.1)),
        ),
        child: Row(
          children: [
            Expanded(
                child: DropdownButtonHideUnderline(
              child: DropdownButton(
                style: TextStyle(
                    color: kBlackColor,
                    fontSize: 16,
                    fontFamily: kFontFamilyPrimary,
                    fontWeight: FontWeight.w500),
                isExpanded: true,
                hint: Text(
                  placeholder,
                  style: const TextStyle(color: kGrayColor),
                ),
                dropdownColor: kWhiteColor,
                value: value,
                onChanged: onChanged,
                items: items
                    ?.map((item) => DropdownMenuItem(
                        value: item["value"], child: Text("${item['label']}")))
                    .toList(),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
