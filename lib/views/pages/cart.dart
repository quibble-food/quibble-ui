import 'package:flutter/material.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({super.key});

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  @override
  Widget build(BuildContext context) {
    return const EmptyShoppingCartScreen();
  }
}

class EmptyShoppingCartScreen extends StatefulWidget {
  const EmptyShoppingCartScreen({super.key});

  @override
  State<EmptyShoppingCartScreen> createState() =>
      _EmptyShoppingCartScreenState();
}

class _EmptyShoppingCartScreenState extends State<EmptyShoppingCartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 70,
              child: Container(
                color: const Color(0xFFFFFFFF),
              ),
            ),
            Column(
              children: [
                Card(
                  elevation: 0,
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: SizedBox(
                    child: ListTile(
                      contentPadding: const EdgeInsets.only(left: 0),
                      leading: Image.asset(
                        "assets/images/networkimages/burger.jpg",
                        fit: BoxFit.cover,
                        height: 100,
                        width: 100,
                      ),
                      title: const Text("burger"),
                      subtitle: const ButtonBar(

                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
