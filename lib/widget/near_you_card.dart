import 'package:flutter/material.dart';
import 'package:app_room_rental/style/style.dart';
import 'package:app_room_rental/data.dart';

class NearYouCard extends StatelessWidget {
  const NearYouCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 272,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              const SizedBox(
                width: 24,
              ),
              for (int i = 0; i < roomDataList.length; i++)
                Row(
                  children: [
                    i == 0
                        ? const SizedBox(
                            width: 0,
                          )
                        : const SizedBox(
                            width: 24,
                          ),
                    (ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                        width: 222,
                        child: Center(
                          child: Stack(
                            children: [
                              Image.asset(
                                roomDataList[i].imageAsset,
                                height: 272,
                                fit: BoxFit.fitHeight,
                              ),
                              Image.asset(
                                'images/near-you-shade.png',
                                height: 272,
                                fit: BoxFit.fitHeight,
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                  top: 20,
                                  left: 133,
                                ),
                                width: 73,
                                height: 24,
                                decoration: BoxDecoration(
                                  color: blackColor.withOpacity(
                                    0.24,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    20,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'images/icon-location.png',
                                      height: 16,
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      '${roomDataList[i].distance} km',
                                      style: descriptionTextStyle.copyWith(
                                        color: whiteColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 215,
                                  left: 20,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      roomDataList[i].name,
                                      style: titleTextStyle,
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      roomDataList[i].location,
                                      style: descriptionTextStyle.copyWith(
                                        color: shineGreyColor,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
                  ],
                ),
              const SizedBox(
                width: 24,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
