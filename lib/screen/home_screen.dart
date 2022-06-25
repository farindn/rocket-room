import 'package:app_room_rental/style/style.dart';
import 'package:app_room_rental/widget/best_you_card.dart';
import 'package:app_room_rental/widget/category.dart';
import 'package:app_room_rental/widget/near_you_card.dart';
import 'package:flutter/material.dart';
import 'package:app_room_rental/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isFiltered = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: MediaQuery.of(context).size.height < 700 ||
                    MediaQuery.of(context).size.width < 384
                ? Container(
                    padding: const EdgeInsets.all(
                      24,
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          lightBlueColor,
                          blueColor,
                        ],
                      ),
                    ),
                    child: Center(
                      child: Image.asset(
                        'images/lol.png',
                      ),
                    ),
                  )
                : Container(
                    constraints: const BoxConstraints(
                      maxWidth: 600,
                    ),
                    child: Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(
                            24,
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Welcome',
                                        style: descriptionTextStyle,
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        'Farin Dian Nugraha',
                                        style: bigTitleTextStyle,
                                      ),
                                    ],
                                  ),
                                  Image.asset(
                                    'images/icon-notif.png',
                                    height: 24,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 22,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width -
                                        24 -
                                        24 -
                                        48 -
                                        8,
                                    height: 48,
                                    constraints: const BoxConstraints(
                                      maxWidth: 600 - 24 - 24 - 48 - 8,
                                    ),
                                    decoration: BoxDecoration(
                                      color: lightGreyColor,
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        const SizedBox(
                                          width: 16,
                                        ),
                                        Image.asset(
                                          'images/icon-search.png',
                                          height: 24,
                                        ),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        Expanded(
                                          child: TextField(
                                            cursorColor: blueColor,
                                            style:
                                                descriptionTextStyle.copyWith(
                                              color: blackColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText:
                                                  'Search address, or near you',
                                              hintStyle: descriptionTextStyle,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 16,
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () {
                                      setState(() {
                                        isFiltered = !isFiltered;
                                      });
                                    },
                                    child: Container(
                                      width: 48,
                                      height: 48,
                                      decoration: BoxDecoration(
                                        color: isFiltered
                                            ? blueColor
                                            : lightGreyColor,
                                        borderRadius: BorderRadius.circular(
                                          10,
                                        ),
                                      ),
                                      child: Center(
                                        child: Image.asset(
                                          'images/icon-filter.png',
                                          height: 24,
                                          color: isFiltered
                                              ? whiteColor
                                              : greyColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: isFiltered ? 86 : 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Near from you',
                                    style: titleTextStyle.copyWith(
                                      color: blackColor,
                                    ),
                                  ),
                                  InkWell(
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () {},
                                    child: Text(
                                      'See more',
                                      style: descriptionTextStyle,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 328,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Best for you',
                                    style: titleTextStyle.copyWith(
                                      color: blackColor,
                                    ),
                                  ),
                                  InkWell(
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () {},
                                    child: Text(
                                      'See more',
                                      style: descriptionTextStyle,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              for (int i = 0; i < roomDataList.length; i++)
                                (Column(
                                  children: [
                                    i == 0
                                        ? const SizedBox(
                                            height: 0,
                                          )
                                        : const SizedBox(
                                            height: 24,
                                          ),
                                    BestYouCard(
                                      room: roomDataList[i],
                                      imageAsset: roomDataList[i].imageAsset,
                                      name: roomDataList[i].name,
                                      price:
                                          'Rp. ${roomDataList[i].price} / Year',
                                      bed: roomDataList[i].bed,
                                      bath: roomDataList[i].bath,
                                    ),
                                  ],
                                ))
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              height: 161,
                            ),
                            isFiltered ? const CategoryList() : Container(),
                            SizedBox(
                              height: isFiltered ? 75 : 19 + 20,
                            ),
                            const NearYouCard(),
                          ],
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
