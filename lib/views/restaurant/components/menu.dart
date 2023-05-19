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

  double _total = 0.0;

  @override
  Widget build(BuildContext context) {
    ScrollController controller = ScrollController();
    final screenSize = MediaQuery.of(context).size;
    final menuImageHeight = screenSize.height * 0.25;
    final menuImageWidth = screenSize.width * 0.3;
    return SingleChildScrollView(
      child: FutureBuilder<List<dynamic>>(
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
                return Stack(
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                            left: screenSize.width * 0.05,
                            right: screenSize.width * 0.05,
                            bottom: screenSize.height * 0.02,
                            top: 0),
                        height: screenSize.height * 0.30,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 10, top: 40),
                                  height: menuImageHeight,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      boxShadow: [
                                        BoxShadow(
                                            offset: const Offset(0, 0),
                                            blurRadius: 60,
                                            color: Colors.grey.shade400
                                                .withOpacity(0.33))
                                      ]),
                                  child: Image.asset(
                                    menuItem.imageUrl,
                                    height: menuImageHeight,
                                    width: menuImageWidth,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              margin:
                                  EdgeInsets.only(top: 60, left: 5, right: 5),
                              child: Column(
                                children: [
                                  Text(
                                    "${menuItem.name}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    "₹ ${menuItem.price}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )),
                    Container(
                      margin: EdgeInsets.only(
                        right: screenSize.width * 0.05 + 2,
                      ),
                      child: Align(
                        alignment: const Alignment(1, -1),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Icon(
                              Icons.crop_square_sharp,
                              color: menuItem.veg ? Colors.green : Colors.red,
                              size: 36,
                            ),
                            Icon(Icons.circle,
                                color: menuItem.veg ? Colors.green : Colors.red,
                                size: 14),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
