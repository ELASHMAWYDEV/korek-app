
import 'package:flutter/material.dart';
import 'package:korek_app/utils/constants.dart';

class MainButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Icon? endIcon;

  const MainButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.endIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            fixedSize: const Size(240, 45),
            backgroundColor: kBlackColor,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50))),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: const TextStyle(color: kWhiteColor, fontSize: 16),
                ),
              ],
            ),
            if (endIcon != null)
              Positioned(
                top: 2,
                right: 0,
                child: endIcon!,
              )
          ],
        ));
  }
}
