import 'package:flutter/material.dart';
import 'package:top_seven/home_page.dart';

class SeconPage extends StatefulWidget {
  Widget yourWidget;

  SeconPage({super.key, required this.yourWidget});

  @override
  State<SeconPage> createState() => _SeconPageState();
}

class _SeconPageState extends State<SeconPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: Center(
        child: widget.yourWidget,
      ),
    );
  }
}
