import 'package:flutter/material.dart';
import 'components/body.dart';
import 'components/buttomnavbar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quibble",
            style: TextStyle(
                fontFamily: 'TitleFont',
                fontSize: 25,
                color: Color.fromARGB(255, 254, 254, 254))),
        backgroundColor: Colors.deepOrange,
      ),
      body: const Body(),
      bottomNavigationBar: const NavBar(),
    );
  }
}
