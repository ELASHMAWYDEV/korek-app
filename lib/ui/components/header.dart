// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:korek_app/utils/constants.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
      decoration: BoxDecoration(color: kWhiteColor, boxShadow: [
        BoxShadow(color: kGrayColor.withOpacity(0.3), blurRadius: 10)
      ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed("/profile");
            },
            child: Icon(
              Icons.account_circle_rounded,
              size: 30,
              color: kGrayColor,
            ),
          ),
          Spacer(),
          Text(
            "Korek",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: kPrimaryDarkColor,
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              Get.toNamed("/notifications");
            },
            child: Icon(
              Icons.notifications_active_outlined,
              size: 30,
              color: kGrayColor,
            ),
          ),
        ],
      ),
    );
  }
}
