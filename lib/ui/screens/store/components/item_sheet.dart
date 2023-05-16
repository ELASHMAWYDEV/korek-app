// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:korek_app/ui/components/main_button.dart';
import 'package:korek_app/ui/components/select.dart';
import 'package:korek_app/utils/constants.dart';

class ItemSheet extends StatefulWidget {
  const ItemSheet({super.key});

  @override
  State<ItemSheet> createState() => _ItemSheetState();
}

class _ItemSheetState extends State<ItemSheet> {
  String? size;
  String? color;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.cover,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.85,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "500 L.E",
                  style: TextStyle(
                      color: kBlackColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.close_rounded,
                    color: kGrayColor,
                    size: 26,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: Image.asset(
                "assets/images/item-image-test.png",
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text("Alternator",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vitae nisi eget nunc ultricies aliquet. ",
              style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w400, color: kGrayColor),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...["2018", "Camry", "Toyota"]
                    .map((item) => Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 6),
                          decoration: BoxDecoration(
                              color: kSecondaryColor,
                              borderRadius: BorderRadius.circular(30)),
                          child: Text(
                            item,
                            maxLines: 1,
                            style: const TextStyle(
                                color: kWhiteColor, fontSize: 14),
                          ),
                        ))
                    .toList()
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Divider(
              indent: 40,
              endIndent: 40,
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Color",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton(
                        alignment: Alignment.centerRight,
                        style: TextStyle(
                          color: kBlackColor,
                          fontSize: 14,
                          fontFamily: kFontFamilyPrimary,
                        ),
                        hint: const Text(
                          "color",
                          style: TextStyle(color: kGrayColor, fontSize: 12),
                        ),
                        dropdownColor: kWhiteColor,
                        value: color,
                        onChanged: (value) {
                          color = value;
                          setState(() {});
                        },
                        items: ["EE5253", "1c1832", "5380d1", "3F3D56"]
                            .map((item) => DropdownMenuItem(
                                value: item,
                                child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Color(int.parse(
                                          "ff${item.toString()}",
                                          radix: 16)),
                                    ))))
                            .toList(),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Size",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton(
                        alignment: Alignment.centerRight,
                        style: TextStyle(
                          color: kBlackColor,
                          fontSize: 14,
                          fontFamily: kFontFamilyPrimary,
                        ),
                        hint: const Text(
                          "size",
                          style: TextStyle(color: kGrayColor, fontSize: 12),
                        ),
                        dropdownColor: kWhiteColor,
                        value: size,
                        onChanged: (value) {
                          size = value;
                          setState(() {});
                        },
                        items: ["32", "34", "36", "38"]
                            .map((item) => DropdownMenuItem(
                                value: item, child: Text(item)))
                            .toList(),
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            MainButton(
                isActive: size != null && color != null,
                onPressed: () {
                  Get.back();
                },
                text: "Add to Cart"),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
