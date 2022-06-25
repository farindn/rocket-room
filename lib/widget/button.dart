// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import '../style/style.dart';

class Button extends StatelessWidget {
  final page;
  final double width;
  final String text;
  final Color buttonColor;
  final Color textColor;
  const Button({
    Key? key,
    required this.width,
    required this.page,
    required this.text,
    required this.buttonColor,
    required this.textColor,
  }) : super(key: key);

  get titleTextStyle => null;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => page,
            ),
          );
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            buttonColor,
          ),
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                16,
              ),
            ),
          ),
        ),
        child: Text(
          text,
          style: highlightedTextStyle.copyWith(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
