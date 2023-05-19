import 'package:flutter/material.dart';
import 'package:quibble/constants.dart';
import 'package:quibble/views/restaurant/components/body.dart';

class Restaurant extends StatelessWidget {
  final String restaurant;
  const Restaurant({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          centerTitle: false,
          titleSpacing: 0.0,
          elevation: 0,
          title: Text(
            restaurant,
            style: TextStyle(
                fontFamily: textFontFamily, fontSize: screen.height * 0.04),
          )),
      body: Body(restaurant: restaurant),
    );
  }
}
