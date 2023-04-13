import 'package:flutter/material.dart';
import 'questionline.dart';
import 'cuisines.dart';
import 'food.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: const [
        Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: QuestionLine()),
        SizedBox(
          height: 100,
          child: Cuisine(),
        ),
        Food()
      ],
    ));
  }
}
