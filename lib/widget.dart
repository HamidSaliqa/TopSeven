import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:lottie/lottie.dart';

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

Widget mytext() {
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
              width: MediaQuery.of(context).size.width,
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
