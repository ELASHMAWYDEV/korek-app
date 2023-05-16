// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:korek_app/ui/components/main_button.dart';
import 'package:korek_app/ui/components/select.dart';
import 'package:korek_app/utils/constants.dart';

class AddToCartModal extends StatefulWidget {
  const AddToCartModal({super.key});

  @override
  State<AddToCartModal> createState() => _AddToCartModalState();
}

class _AddToCartModalState extends State<AddToCartModal> {
  String? size;
  String? color;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: kWhiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: FittedBox(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Color",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
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
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
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
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Text(
                  "I changed my mind",
                  style: TextStyle(color: kGrayColor, fontSize: 12),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
