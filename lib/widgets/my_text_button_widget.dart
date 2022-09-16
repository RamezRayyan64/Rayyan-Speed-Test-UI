import 'package:flutter/material.dart';

class MyTextButtonWidget extends StatelessWidget {
  const MyTextButtonWidget({
    Key? key,
    required this.text,
    required this.clickedStatus,
    required this.onPressedButton,
  }) : super(key: key);

  final String text;
  final bool clickedStatus;
  final Function() onPressedButton;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressedButton,
        style: ButtonStyle(
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 30)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
            backgroundColor: MaterialStateProperty.all(
              clickedStatus ? const Color(0xFF523185) : const Color(0xFF3B1D66),
            ),
            overlayColor: MaterialStateProperty.all(const Color(0xFF6F519F))),
        child: Text(
          text,
          style: TextStyle(
            color: clickedStatus ? Colors.white : const Color(0xFF6F519F),
            fontSize: 18,
          ),
        ));
  }
}
