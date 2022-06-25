import 'package:flutter/material.dart';
import 'package:app_room_rental/style/style.dart';
import 'nav_button.dart';
import 'package:app_room_rental/data.dart';

class DetailCard extends StatefulWidget {
  final RoomData room;
  const DetailCard({
    Key? key,
    required this.room,
  }) : super(key: key);

  @override
  State<DetailCard> createState() => _DetailCardState();
}

class _DetailCardState extends State<DetailCard> {
  bool isBookmarked = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                20,
              ),
              child: Image.asset(
                widget.room.imageAsset,
                height: 304,
                width: MediaQuery.of(context).size.width - 48,
                fit: BoxFit.cover,
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(
                20,
              ),
              child: Image.asset(
                'images/detail-shade.png',
                height: 304,
                width: MediaQuery.of(context).size.width - 48,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(
            20,
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    InkWell(
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const NavButton(
                        imageAsset: 'images/icon-back.png',
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          isBookmarked = !isBookmarked;
                        });
                      },
                      child: NavButton(
                        imageAsset: isBookmarked
                            ? 'images/icon-bookmarked.png'
                            : 'images/icon-bookmark.png',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 136,
                ),
                Text(
                  widget.room.name,
                  style: bigTitleTextStyle.copyWith(
                    color: whiteColor,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  '${widget.room.location}, ${widget.room.city}',
                  style: descriptionTextStyle.copyWith(
                    color: shineGreyColor,
                  ),
                ),
                const SizedBox(
                  height: 65 - 40,
                ),
                SizedBox(
                  height: 28,
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: whiteColor.withOpacity(
                            0.34,
                          ),
                          borderRadius: BorderRadius.circular(
                            5,
                          ),
                        ),
                        child: Image.asset(
                          'images/icon-bed.png',
                          color: whiteColor,
                          height: 24,
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        '${widget.room.bed} Bedroom',
                        style: descriptionTextStyle.copyWith(
                            color: shineGreyColor),
                      ),
                      const SizedBox(
                        width: 32,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: whiteColor.withOpacity(
                            0.34,
                          ),
                          borderRadius: BorderRadius.circular(
                            5,
                          ),
                        ),
                        child: Image.asset(
                          'images/icon-bath.png',
                          color: whiteColor,
                          height: 24,
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        '${widget.room.bath} Bathoom',
                        style: descriptionTextStyle.copyWith(
                            color: shineGreyColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
