import 'package:flutter/material.dart';
import 'package:quibble/views/cartpage/cart.dart';
import 'components/body.dart';
import 'components/buttomnavbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

const PAGES = {
  0: Placeholder(),
  1: Body(),
  2: CartPage(),
};

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 1;
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
      body: PAGES[selectedIndex],
      bottomNavigationBar: NavBar(
        changePage: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
