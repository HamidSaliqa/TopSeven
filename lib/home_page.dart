import 'package:flutter/material.dart';
import 'package:top_seven/widget.dart';
import 'second_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> libraryNames = [
    "Lottie",
    "Share",
    "animated_text",
    "carousel_slider",
    "animated_size_and_fade",
    "animated_size_and_fade",
    "animated_size_and_fade",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Top seven",
          style: TextStyle(fontSize: 30),
        ),
        backgroundColor: Colors.deepPurple[900],
      ),
      body: GridView.count(
        crossAxisCount: 2, // تعداد ستون‌ها
        children: List.generate(libraryNames.length, (index) {
          return CustomButton(nameOfLibrary: libraryNames[index]);
        }),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String nameOfLibrary;

  CustomButton({required this.nameOfLibrary});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.black12, offset: Offset(2, 2), blurRadius: 8)
      ]),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.deepPurple[900])),
        onPressed: () => forOnpressed(context),
        child: Text(
          nameOfLibrary,
          style: labelTextStyle,
        ),
      ),
    );
  }

  /// on pressed
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
    } else if (nameOfLibrary == "carousel_slider") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SeconPage(yourWidget: slider()),
        ),
      );
    }
  }
}
