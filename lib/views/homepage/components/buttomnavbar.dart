import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  final ValueSetter changePage;
  const NavBar({super.key, required this.changePage});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentTab = 1;

  @override
  Widget build(BuildContext context) {
    void onPageChange(index) {
      setState(() {
          _currentTab = index;
        });
        widget.changePage(index);
    }
    return BottomNavigationBar(
      currentIndex: _currentTab,
      onTap: onPageChange,
      items: [
        BottomNavigationBarItem(
          icon: InkWell(
            child: Image.asset(
              'assets/images/socialmedia.png',
              width: 24,
              height: 24,
            ),
          ),
          label: "Feeds",
        ),
        BottomNavigationBarItem(
            icon: InkWell(
              child: Image.asset(
                'assets/images/nav-food.png',
                width: 24,
                height: 24,
              ),
            ),
            label: "Restaurants"),
        BottomNavigationBarItem(
          icon: InkWell(
            child: Image.asset(
              'assets/images/account.png',
              width: 24,
              height: 24,
            ),
          ),
          label: "Cart",
        )
      ],
    );
  }
}
