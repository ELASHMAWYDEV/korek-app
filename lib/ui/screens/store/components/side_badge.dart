import 'package:flutter/material.dart';
import 'package:korek_app/utils/constants.dart';

class SideBadge extends StatelessWidget {
  const SideBadge(
      {super.key,
      required this.icon,
      required this.count,
      this.onClick,
      this.color = kSecondaryColor});

  final Widget icon;
  final int count;
  final VoidCallback? onClick;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        decoration: BoxDecoration(
            color: color,
            boxShadow: [
              BoxShadow(color: kBlackColor.withOpacity(0.2), blurRadius: 5)
            ],
            borderRadius: const BorderRadius.only(
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
