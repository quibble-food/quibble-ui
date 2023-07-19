import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quibble/models/food.dart';
import 'package:quibble/views/restaurant/components/foodimage.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../providers/cartitemsprovider.dart';
import '../../../services/getfooditems.dart';
import '../../searchinrestaurant/searchinrestaurant.dart';
import 'addtocart.dart';

class Menu extends StatefulWidget {
  final String restaurant;
  final List<FoodItem> menuItemsFromSearch;
  Menu({
    super.key,
    this.menuItemsFromSearch = const [],
    required this.restaurant,
  });

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  late Future<List<FoodItem>> _menu;
  List<FoodItem> _menuItems = [];
  List<FoodItem> cart = [];
  double total = 0.0;
  late TextEditingController textController;

  Future<void> setMenuItems(Future<List<FoodItem>> _menu) async {
    _menuItems = await _menu;
  }

  @override
  void initState() {
    super.initState();
    textController = TextEditingController(text: '');
    if (widget.menuItemsFromSearch.length == 0) {
      _menu = getMenu(widget.restaurant);
    } else {
      _menu = Future.value(widget.menuItemsFromSearch);
    }
    setMenuItems(_menu);
  }

  @override
  void dispose() {
    super.dispose();
    textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final menuImageHeight = screenSize.height * 0.25;
    final menuImageWidth = screenSize.width * 0.3;
    final cart = Provider.of<CartItemsProvider>(context);

    return ChangeNotifierProvider(
      create: (context) => CartItemsProvider(),
      child: Flex(direction: Axis.vertical, children: [
        Expanded(
          flex: 0,
          child: Container(
            height: screenSize.height * 0.06,
            margin: EdgeInsets.fromLTRB(
                screenSize.width * 0.05,
                screenSize.height * 0.03,
                screenSize.width * 0.05,
                screenSize.width * 0.05),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(36))),
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: CupertinoSearchTextField(
                    backgroundColor: Colors.white,
                    controller: textController,
                    placeholder: 'Search for something tasty',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          fullscreenDialog: true,
                          builder: (context) => SearchInRestaurantWidget(
                            restaurant: widget.restaurant,
                            menuItems: _menuItems,
                          ),
                        ),
                      );
                    })),
          ),
        ),
        Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: FutureBuilder<List<dynamic>>(
                future: _menu,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: _menuItems.length,
                      itemBuilder: (context, index) {
                        final menuItem = _menuItems[index];
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 0,
                                      child: FoodImage(
                                          imageUrl: menuItem.imageUrl,
                                          menuImageHeight: menuImageHeight,
                                          menuImageWidth: menuImageWidth),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        alignment: Alignment.topLeft,
                                        margin: const EdgeInsets.only(
                                            top: 60, left: 10, right: 5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              menuItem.name,
                                              style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18),
                                              ),
                                            ),
                                            Text(
                                              "₹ ${menuItem.price}",
                                              style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black,
                                                      fontSize: 18)),
                                            ),
                                            const Spacer(),
                                            AddToCartButton(
                                              index: index,
                                              item: menuItem,
                                            )
                                          ],
                                        ),
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
                                      color: menuItem.veg
                                          ? Colors.green
                                          : Colors.red,
                                      size: 36,
                                    ),
                                    Icon(Icons.circle,
                                        color: menuItem.veg
                                            ? Colors.green
                                            : Colors.red,
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
            ))
      ]),
    );
  }
}
