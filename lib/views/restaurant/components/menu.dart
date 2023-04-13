import 'package:flutter/material.dart';

import '../../../services/getfooditems.dart';

class Menu extends StatefulWidget {
  final String restaurant;

  const Menu({super.key, required this.restaurant});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  late Future<List<dynamic>> _menu;
  final _menuAPI = FoodItems();

  @override
  void initState() {
    super.initState();
    _menu = _menuAPI.getMenu(widget.restaurant);
  }

  int _count = 0;

  @override
  Widget build(BuildContext context) {
    ScrollController controller = ScrollController();
    final screenSize = MediaQuery.of(context).size;
    final menuImageHeight = screenSize.height * 0.35;
    final menuImageWidth = screenSize.width * 0.35;
    return FutureBuilder<List<dynamic>>(
      future: _menu,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            controller: controller,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final menuItem = snapshot.data![index];
              return ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 6.0, horizontal: 5.0),
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
                leading: Stack(
                  children: [
                    Image.asset(
                      menuItem.imageUrl,
                      fit: BoxFit.fill,
                      height: menuImageHeight,
                      width: menuImageWidth,
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          // Set the color of the container
                          borderRadius: BorderRadius.circular(2),
                          border: Border.all(color: Colors.green, width: 1),
                          color:
                              Colors.white, // Set the radius of the container
                        ),
                        height: 30,
                        width: menuImageWidth * 0.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _count > 0
                                ? IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: () {
                                      setState(() {
                                        if (_count > 0) {
                                          _count--;
                                        }
                                      });
                                    },
                                  )
                                : const SizedBox.shrink(),
                            _count == 0
                                ? TextButton(
                                    onPressed: () {
                                      setState(() {
                                        _count++;
                                      });
                                    },
                                    child: const Text(
                                      "Add",
                                      style: TextStyle(fontSize: 10),
                                    ))
                                : const SizedBox.shrink(),
                            _count > 0
                                ? Text(
                                    '$_count',
                                    style: const TextStyle(fontSize: 14),
                                  )
                                : const SizedBox.shrink(),
                            _count > 0
                                ? IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () {
                                      setState(() {
                                        _count++;
                                      });
                                    },
                                  )
                                : SizedBox.shrink(),
                          ],
                        ),
                      ),
                    ),
                  ],
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
