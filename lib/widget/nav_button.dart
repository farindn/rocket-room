import 'package:app_room_rental/style/style.dart';
import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  final String imageAsset;

  const NavButton({
    Key? key,
    required this.imageAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 34,
      decoration: BoxDecoration(
        color: blackColor.withOpacity(
          0.34,
        ),
        borderRadius: BorderRadius.circular(
          34,
        ),
      ),
      child: Center(
        child: Image.asset(
          imageAsset,
          height: 24,
        ),
      ),
    );
  }
}
