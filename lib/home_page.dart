import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:lottie/lottie.dart';
import 'second_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> libraryNames = [
    "Lottie",
    "Share",
    "animated_text_kit",
    "animated_size_and_fade",
    "animated_size_and_fade",
    "animated_size_and_fade",
    "animated_size_and_fade",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Top seven"),
      ),
      body: ListView.builder(
        itemCount: libraryNames.length,
        itemBuilder: (context, index) {
          return CustomButton(nameOfLibrary: libraryNames[index]);
        },
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String nameOfLibrary;

  CustomButton({required this.nameOfLibrary});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => forOnpressed(context),
        child: Text(
          nameOfLibrary,
          style: labelTextStyle,
        ),
      ),
    );
  }

  forOnpressed(BuildContext context) {
    if (nameOfLibrary == "Lottie") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SeconPage(yourWidget: myLottie()),
        ),
      );
    } else if (nameOfLibrary == "Share") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SeconPage(yourWidget: myShareButton()),
        ),
      );
    } else if (nameOfLibrary == "animated_text_kit") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SeconPage(yourWidget: mytext()),
        ),
      );
    }
  }
}

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
