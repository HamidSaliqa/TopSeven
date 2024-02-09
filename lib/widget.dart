import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:lottie/lottie.dart';
import 'package:top_seven/second_page.dart';

const labelTextStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

Widget myLottie() {
  return Lottie.asset("assets/animation/Animation1json");
}

Widget myShareButton() {
  return ElevatedButton(
      onPressed: () async {
        await FlutterShare.share(title: "Share");
      },
      child: Text("Click Me"));
}

Widget myText() {
  return SizedBox(
    width: 250.0,
    child: DefaultTextStyle(
      style: const TextStyle(
          fontSize: 40.0, fontFamily: 'Canterbury', color: Colors.black),
      child: AnimatedTextKit(
        animatedTexts: [
          ScaleAnimatedText('Welcome'),
          ScaleAnimatedText('it is me animated_text_kit'),
          ScaleAnimatedText('Good Bye'),
        ],
        onTap: () {},
      ),
    ),
  );
}

Widget slider() {
  return CarouselSlider(
    options: CarouselOptions(height: 400.0),
    items: [1, 2, 3, 4, 5].map((i) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(color: Colors.deepPurple[900]),
              child: Center(
                  child: Text(
                    'text $i',
                    style: TextStyle(fontSize: 25.0, color: Colors.white),
                  )));
        },
      );
    }).toList(),
  );
}

Widget codePiker() {
  return CountryCodePicker(
    onChanged: print,
    // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
    initialSelection: 'IT',
    favorite: ['+93', 'AFG'],
    // optional. Shows only country name and flag
    showCountryOnly: false,
    // optional. Shows only country name and flag when popup is closed.
    showOnlyCountryWhenClosed: false,
    // optional. aligns the flag and the Text left
    alignLeft: false,
  );
}



Widget  splash(){
  return AnimatedSplashScreen(
    splash: 'assets/splash.png',
    nextScreen: SeconPage(yourWidget: Text("Done")),
    splashTransition: SplashTransition.rotationTransition,
  );
}
