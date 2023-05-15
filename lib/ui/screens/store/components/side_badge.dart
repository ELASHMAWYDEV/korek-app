import 'package:flutter/material.dart';
import 'package:korek_app/utils/constants.dart';

class SideBadge extends StatelessWidget {
  const SideBadge(
      {super.key, required this.icon, required this.count, this.onClick});

  final Widget icon;
  final int count;
  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        decoration: const BoxDecoration(
            color: kSecondaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), bottomLeft: Radius.circular(20))),
        padding: const EdgeInsets.fromLTRB(15, 7, 12, 7),
        child: Row(children: [
          icon,
          const SizedBox(width: 5),
          Text(
            count.toString(),
            style: const TextStyle(
                fontSize: 12, fontWeight: FontWeight.bold, color: kWhiteColor),
          ),
        ]),
      ),
    );
  }
}
