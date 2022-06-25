import 'package:app_room_rental/screen/home_screen.dart';
import 'package:app_room_rental/style/style.dart';
import 'package:app_room_rental/widget/button.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  lightBlueColor,
                  blueColor,
                ]),
          ),
          child: MediaQuery.of(context).size.height < 700 ||
                  MediaQuery.of(context).size.width < 384
              ? Padding(
                  padding: const EdgeInsets.all(
                    24,
                  ),
                  child: Center(
                    child: Image.asset(
                      'images/lol.png',
                    ),
                  ),
                )
              : SafeArea(
                  child: Container(
                    padding: const EdgeInsets.all(
                      24,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Rocket\nRoom',
                          textAlign: TextAlign.center,
                          style: headerTextStyle,
                        ),
                        const Spacer(),
                        Image.asset(
                          'images/splash-logo.png',
                          height: 336,
                        ),
                        const Spacer(),
                        Text(
                          'We help you to find a room\nwith amazing facilities\nas fast as a rocket',
                          textAlign: TextAlign.center,
                          style: titleTextStyle,
                        ),
                        const Spacer(),
                        Button(
                          page: const HomeScreen(),
                          text: "Explore Now",
                          buttonColor: yellowColor,
                          textColor: blackColor,
                          width: 210,
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
