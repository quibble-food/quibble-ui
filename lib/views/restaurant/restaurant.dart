import 'package:flutter/material.dart';
import 'package:quibble/views/restaurant/components/body.dart';

class Menu extends StatelessWidget {
  final String restaurant;
  const Menu({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(""),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Body(restaurant: restaurant));
  }
}
