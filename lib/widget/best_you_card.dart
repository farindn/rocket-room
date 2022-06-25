import 'package:app_room_rental/data.dart';
import 'package:app_room_rental/screen/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:app_room_rental/style/style.dart';

class BestYouCard extends StatelessWidget {
  final RoomData room;
  final String imageAsset;
  final String name;
  final String price;
  final int bed;
  final int bath;

  const BestYouCard({
    Key? key,
    required this.room,
    required this.imageAsset,
    required this.name,
    required this.price,
    required this.bed,
    required this.bath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              room: room,
            ),
          ),
        );
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
              10,
            ),
            child: SizedBox(
              width: 74,
              height: 70,
              child: Center(
                child: Image.asset(
                  imageAsset,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: titleTextStyle.copyWith(
                  color: blackColor,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                price,
                style: descriptionTextStyle.copyWith(
                  color: blueColor,
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Row(
                children: [
                  Image.asset(
                    'images/icon-bed.png',
                    width: 24,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    '$bed Bedroom',
                    style: descriptionTextStyle,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Image.asset(
                    'images/icon-bath.png',
                    width: 24,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    '$bath Bathroom',
                    style: descriptionTextStyle,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
