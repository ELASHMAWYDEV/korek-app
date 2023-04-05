import 'package:flutter/material.dart';
import 'package:korek_app/ui/controllers/intro_controller.dart';

class IntroSlide extends StatelessWidget {
  const IntroSlide({
    Key? key,
    required this.slide,
  }) : super(key: key);

  final SlideModel slide;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.35,
          child: slide.image,
        ),
        const Spacer(),
        Visibility(
          visible: slide.title != null && slide.description != null,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 15),
            child: Column(
              children: [
                if (slide.title != null)
                  Text("${slide.title}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold)),
                if (slide.description != null)
                  Text(
                    "${slide.description}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      height: 1.6,
                    ),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
