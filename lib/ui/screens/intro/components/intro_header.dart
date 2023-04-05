import 'package:flutter/material.dart';
import 'package:korek_app/utils/constants.dart';

class IntroHeader extends StatelessWidget {
  const IntroHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Image.asset("assets/images/logo-nobg.png", height: 70));
  }
}
