import 'package:flutter/material.dart';
import 'package:korek_app/utils/constants.dart';

class MainButton extends StatefulWidget {
  final Function onPressed;
  final String text;
  final Icon? endIcon;
  final bool isActive;
  final bool isLoaderEnabled;

  const MainButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.endIcon,
    this.isActive = true,
    this.isLoaderEnabled = true,
  });

  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () async {
          if (widget.isLoaderEnabled) {
            setState(() {
              isLoading = true;
            });
          }
          if (widget.isActive) {
            await widget.onPressed();
          }
          if (widget.isLoaderEnabled) {
            setState(() {
              isLoading = false;
            });
          }
        },
        style: TextButton.styleFrom(
            fixedSize: const Size(240, 45),
            backgroundColor: widget.isActive ? kBlackColor : kGrayColor,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50))),
        child: isLoading
            ? const CircularProgressIndicator(
                color: kWhiteColor, strokeWidth: 2.5)
            : Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        widget.text,
                        style:
                            const TextStyle(color: kWhiteColor, fontSize: 16),
                      ),
                    ],
                  ),
                  if (widget.endIcon != null)
                    Positioned(
                      top: 2,
                      right: 0,
                      child: widget.endIcon!,
                    )
                ],
              ));
  }
}
