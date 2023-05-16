import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:korek_app/ui/components/input.dart';
import 'package:korek_app/ui/controllers/store_controller.dart';
import 'package:korek_app/utils/constants.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoreController>(builder: (_) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Input(
            placeholder: "Search",
            borderRadius: 50,
            padding: const EdgeInsets.symmetric(horizontal: 18),
            ending: DropdownButtonHideUnderline(
              child: DropdownButton(
                alignment: Alignment.centerRight,
                style: TextStyle(
                  color: kBlackColor,
                  fontSize: 12,
                  fontFamily: kFontFamilyPrimary,
                ),
                hint: const Text(
                  "Category",
                  style: TextStyle(color: kGrayColor, fontSize: 12),
                ),
                dropdownColor: kWhiteColor,
                value: _.selectedCategory,
                onChanged: (value) {
                  _.selectedCategory = value;
                  _.update();
                },
                items: ["Parts", "Accessories", "Tools", "Tires"]
                    .map((item) =>
                        DropdownMenuItem(value: item, child: Text(item)))
                    .toList(),
              ),
            )),
      );
    });
  }
}
