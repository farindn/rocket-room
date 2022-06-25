import 'package:flutter/material.dart';
import 'package:app_room_rental/style/style.dart';

class CategoryCard extends StatefulWidget {
  final String name;

  const CategoryCard({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            setState(() {
              isClicked = !isClicked;
            });
          },
          child: Container(
            height: 34,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              color: isClicked ? blueColor : lightGreyColor,
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            child: Center(
              child: Text(
                widget.name,
                style: descriptionTextStyle.copyWith(
                  color: isClicked ? whiteColor : greyColor,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
      ],
    );
  }
}

List categoryName = [
  'Home',
  'Apartment',
  'Hotel',
  'Villa',
  'Cottage',
];

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: 34,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                const SizedBox(
                  width: 24,
                ),
                CategoryCard(
                  name: categoryName[0],
                ),
                CategoryCard(
                  name: categoryName[1],
                ),
                CategoryCard(
                  name: categoryName[2],
                ),
                CategoryCard(
                  name: categoryName[3],
                ),
                CategoryCard(
                  name: categoryName[4],
                ),
                const SizedBox(
                  width: 24 - 8,
                ),
              ],
            )),
      ],
    );
  }
}
