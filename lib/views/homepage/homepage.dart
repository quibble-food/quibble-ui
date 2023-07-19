import 'package:flutter/material.dart';
import 'components/body.dart';
import 'components/buttomnavbar.dart';

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
                color: Colors.deepOrange,
              ),
            ),
            const Spacer(),
            const Text(
              "RVCE",
              style: TextStyle(
                fontFamily: 'roboto',
                fontSize: 18,
                color: Colors.deepOrange,
              ),
            ),
            IconButton(
              icon: Icon(Icons.location_on, color: Colors.purple.shade600),
              onPressed: () {
                // Your code here
              },
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: const Body(),
      bottomNavigationBar: const NavBar(),
    );
  }
}
