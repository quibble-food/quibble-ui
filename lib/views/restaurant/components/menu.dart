import 'package:flutter/material.dart';

import '../../../models/food.dart';
import '../../../services/getfooditems.dart';

class Menu extends StatefulWidget {
  final String restaurant;

  const Menu({required this.restaurant});

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  late Future<List<dynamic>> _menu;
  final _menuAPI = FoodItems();

  @override
  void initState() {
    super.initState();
    _menu = _menuAPI.getMenu(widget.restaurant);
  }

  @override
  Widget build(BuildContext context) {
    ScrollController _controller = new ScrollController();
    final screenSize = MediaQuery.of(context).size;
    return FutureBuilder<List<dynamic>>(
      future: _menu,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            controller: _controller,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final menuItem = snapshot.data![index];
              return ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                title: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: menuItem.description,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                        ),
                      ),
                      const TextSpan(
                        text: '₹',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                        ),
                      ),
                      TextSpan(
                        text: "${menuItem.price}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ),
                leading: Image.asset(
                  menuItem.imageUrl,
                  height: screenSize.height * 0.2,
                  width: screenSize.width * 0.35,
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
