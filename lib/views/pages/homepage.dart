import 'package:flutter/material.dart';
import '../homepage/components/body.dart';
import '../homepage/components/buttomnavbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text(
              "Quibble",
              style: TextStyle(
                fontFamily: 'TitleFont',
                fontSize: 25,
                color: Color.fromARGB(255, 254, 254, 254),
              ),
            ),
            const Spacer(),
            const Text(
              "RVCE",
              style: TextStyle(
                fontFamily: 'roboto',
                fontSize: 18,
                color: Color.fromARGB(255, 254, 254, 254),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.location_on, color: Colors.white),
              onPressed: () {
                // Your code here
              },
            ),
          ],
        ),
        backgroundColor: Colors.deepOrange,
      ),
      body: const Body(),
      bottomNavigationBar: const NavBar(),
    );
  }
}
