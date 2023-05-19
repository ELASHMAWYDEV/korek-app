// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:korek_app/ui/components/main_button.dart';
import 'package:korek_app/ui/screens/store/components/item_box.dart';
import 'package:korek_app/utils/constants.dart';

class CartModal extends StatefulWidget {
  const CartModal({super.key});

  @override
  State<CartModal> createState() => _CartModalState();
}

class _CartModalState extends State<CartModal> {
  String? paymentMethod;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: kWhiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      child: ConstrainedBox(
        constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.78),
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
                        "Cart",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
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
                Container(
                  decoration: BoxDecoration(color: kWhiteColor, boxShadow: [
                    BoxShadow(
                      color: kGrayColor.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 4),
                    )
                  ]),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * 0.4),
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Column(children: [
                        ...[1, 2, 3, 4, 5, 6]
                            .map((item) => Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: ItemBox(
                                    isSmall: true,
                                    isCartItem: true,
                                  ),
                                ))
                            .toList()
                      ]),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(fontSize: 22),
                          ),
                          Text(
                            "460 L.E",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      Divider(
                        indent: 40,
                        endIndent: 40,
                        height: 30,
                      ),
                      Text(
                        "Select payment",
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Radio(
                                  value: "wallet",
                                  groupValue: paymentMethod,
                                  activeColor: kPrimaryColor,
                                  toggleable: true,
                                  splashRadius: 20,
                                  onChanged: (value) {
                                    paymentMethod = value;
                                    setState(() {});
                                  }),
                              Text(
                                "Wallet",
                                style: TextStyle(
                                    color: paymentMethod == "wallet"
                                        ? kBlackColor
                                        : kGrayDarkColor),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                  value: "cash",
                                  groupValue: paymentMethod,
                                  activeColor: kPrimaryColor,
                                  toggleable: true,
                                  splashRadius: 20,
                                  onChanged: (value) {
                                    paymentMethod = value;
                                    setState(() {});
                                  }),
                              Text(
                                "Cash",
                                style: TextStyle(
                                    color: paymentMethod == "cash"
                                        ? kBlackColor
                                        : kGrayDarkColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MainButton(
                          onPressed: () {},
                          isActive: paymentMethod != null,
                          text: "Confirm Order")
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
