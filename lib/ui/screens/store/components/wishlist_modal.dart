// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:korek_app/ui/components/main_button.dart';
import 'package:korek_app/ui/components/select.dart';
import 'package:korek_app/ui/screens/store/components/item_box.dart';
import 'package:korek_app/utils/constants.dart';

class WishlistModal extends StatefulWidget {
  const WishlistModal({super.key});

  @override
  State<WishlistModal> createState() => _WishlistModalState();
}

class _WishlistModalState extends State<WishlistModal> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: kWhiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.7),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(),
                      Text(
                        "My Wishlist",
                        style: TextStyle(fontSize: 20),
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
                ),
                SizedBox(
                  height: 30,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                      maxHeight:
                          MediaQuery.of(context).size.height * 0.7 - 100),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(children: [
                      ...[1, 2, 3, 4, 5, 6]
                          .map((item) => Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: ItemBox(isSmall: true),
                              ))
                          .toList()
                    ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
