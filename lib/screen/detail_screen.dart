import 'package:app_room_rental/screen/splash_screen.dart';
import 'package:app_room_rental/widget/detail_card.dart';
import 'package:flutter/material.dart';
import 'package:app_room_rental/style/style.dart';
import 'package:app_room_rental/data.dart';

import '../widget/button.dart';

class DetailScreen extends StatelessWidget {
  final RoomData room;
  const DetailScreen({Key? key, required this.room}) : super(key: key);

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
                    padding: const EdgeInsets.all(
                      24,
                    ),
                    child: Center(
                      child: Container(
                        constraints: const BoxConstraints(
                          maxWidth: 600,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DetailCard(
                              room: room,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Description',
                              style: titleTextStyle.copyWith(
                                color: blackColor,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              room.description,
                              style: descriptionTextStyle,
                              textAlign: TextAlign.justify,
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            Text(
                              'Gallery',
                              style: titleTextStyle.copyWith(
                                color: blackColor,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                  child: Image.asset(
                                    'images/gallery-1.png',
                                    width: 72,
                                    height: 72,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                  child: Image.asset(
                                    'images/gallery-2.png',
                                    width: 72,
                                    height: 72,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                  child: Image.asset(
                                    'images/gallery-3.png',
                                    width: 72,
                                    height: 72,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                  child: SizedBox(
                                    width: 72,
                                    height: 72,
                                    child: Center(
                                      child: Stack(
                                        children: [
                                          Image.asset(
                                            'images/gallery-4.png',
                                            width: 72,
                                            height: 72,
                                            fit: BoxFit.cover,
                                          ),
                                          Image.asset(
                                            'images/gallery-shade.png',
                                            width: 72,
                                            height: 72,
                                            fit: BoxFit.cover,
                                          ),
                                          Center(
                                            child: Text(
                                              "5+",
                                              style: bigTitleTextStyle.copyWith(
                                                color: whiteColor,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            Center(
                              child: Button(
                                width: MediaQuery.of(context).size.width,
                                page: const SplashScreen(),
                                text: 'Book Now',
                                buttonColor: blueColor,
                                textColor: whiteColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
