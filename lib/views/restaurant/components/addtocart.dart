import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quibble/providers/cartitemsprovider.dart';

import '../../../models/food.dart';

class AddToCartButton extends StatefulWidget {
  FoodItem item;
  int index;
  AddToCartButton({
    super.key,
    required this.index,
    required this.item,
  });

  @override
  State<AddToCartButton> createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  bool addButtonClicked = false;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartItemsProvider>(context, listen: false);
    Size screen = MediaQuery.of(context).size;
    return Container(
      width: screen.width * 0.3,
      height: screen.height * 0.05,
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: addButtonClicked
          ? Expanded(
              flex: 0,
              child: Container(
                  width: screen.width * 0.3,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Row(children: [
                    Container(
                      width: screen.width * 0.09,
                      height: screen.height * 0.45,
                      child: InkWell(
                          onTap: () {
                            setState(() {
                              widget.item.count--;
                              cart.removeFromCart(widget.item);

                              if (widget.item.count == 0) {
                                addButtonClicked = false;
                              }
                            });
                          },
                          child: Icon(
                            Icons.remove,
                            color: Colors.purple.shade600,
                            size: 16,
                          )),
                    ),
                    Container(
                      width: screen.width * 0.09,
                      alignment: Alignment.center,
                      height: screen.height * 0.45,
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 3, vertical: 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Colors.purple.shade600),
                      child: Text(
                        '${widget.item.count}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      width: screen.width * 0.09,
                      height: screen.height * 0.45,
                      child: InkWell(
                          onTap: () {
                            setState(() {
                              widget.item.count++;
                              cart.addToCart(widget.item);
                              if (widget.item.count == 0) {
                                addButtonClicked = false;
                              }
                            });
                          },
                          child: Icon(
                            Icons.add,
                            color: Colors.purple.shade600,
                            size: 16,
                          )),
                    ),
                  ])),
            )
          : Container(
              width: screen.width * 0.25,
              height: screen.height * 0.035,
              alignment: Alignment.center,
              color: Colors.deepOrange,
              child: InkWell(
                  onTap: () {
                    setState(() {
                      addButtonClicked = true;
                      widget.item.count++;
                      cart.addToCart(widget.item);
                    });
                  },
                  child: Text(
                    widget.item.isCustomizable ? 'Customise' : "Add",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600)),
                  )),
            ),
    );
  }
}
