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
    "animated\ntext",
    "carousel\nslider",
    "countrycode",
    "splash",
    "Action Slider",
  ];

  final Map<String, Widget> libraryRoutes = {
    "Lottie": SeconPage(yourWidget: myLottie()),
    "Share": SeconPage(yourWidget: myShareButton()),
    "animated\ntext": SeconPage(yourWidget: myText()),
    "splash": SeconPage(yourWidget: splash()),
    "carousel\nslider": SeconPage(yourWidget: slider()),
    "countrycode": SeconPage(yourWidget: codePiker()),
    "Action Slider": SeconPage(yourWidget: actionSlider()),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Top seven",
          style: TextStyle(fontSize: 40, fontFamily: 'CustomFont'),
        ),
        backgroundColor: Colors.deepPurple[900],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(libraryNames.length, (index) {
          return CustomButton(
            nameOfLibrary: libraryNames[index],
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => libraryRoutes[libraryNames[index]]!,
                ),
              );
            },
          );
        }),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String nameOfLibrary;
  final VoidCallback onPressed;

  CustomButton({required this.nameOfLibrary, required this.onPressed});

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
        onPressed: onPressed,
        child: Text(
          nameOfLibrary,
          style: labelTextStyle,
        ),
      ),
    );
  }
}
