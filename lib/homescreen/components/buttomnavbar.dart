import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentTab = 1;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentTab,
      onTap: (int index) {
        setState(() {
          _currentTab = index;
        });
      },
      items: [
        BottomNavigationBarItem(
            icon: InkWell(
              onTap: () => {},
              child: Image.asset(
                'assets/images/nav-gift.png',
                width: 24,
                height: 24,
              ),
            ),
            label: "Gifts"),
        BottomNavigationBarItem(
            icon: InkWell(
              onTap: () => {},
              child: Image.asset(
                'assets/images/nav-food.png',
                width: 24,
                height: 24,
              ),
            ),
            label: "Restaurants"),
        BottomNavigationBarItem(
            icon: InkWell(
              onTap: () => {},
              child: Image.asset(
                'assets/images/nav-wallet.png',
                width: 24,
                height: 24,
              ),
            ),
            label: "Wallet")
      ],
    );
  }
}
