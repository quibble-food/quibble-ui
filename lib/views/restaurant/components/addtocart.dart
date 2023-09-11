import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quibble/constants.dart';
import 'package:quibble/providers/cartitemsprovider.dart';

import '../../../models/food.dart';

class AddToCartButton extends StatefulWidget {
  final FoodItem item;
  final double menuImageWidth;
  const AddToCartButton({
    super.key,
    required this.item,
    required this.menuImageWidth,
  });

  @override
  State<AddToCartButton> createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  @override
  Widget build(BuildContext context) {
    bool addButtonClicked = false || widget.item.count != 0;
    final cart = Provider.of<CartItemsProvider>(context, listen: false);
    Size screen = MediaQuery.of(context).size;
    void buttonClick() {
      setState(
        () {
          widget.item.count++;
          cart.addToCart(widget.item);
          if (widget.item.count == 0) {
            addButtonClicked = false;
          }
        },
      );
    }

    return Container(
      width: widget.menuImageWidth - 18,
      margin: const EdgeInsets.symmetric(horizontal: 9),
      child: addButtonClicked
          ? Expanded(
              flex: 0,
              child: Container(
                width: widget.menuImageWidth - 20,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.grey.shade400,
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: (widget.menuImageWidth - 20) * 0.3,
                      child: InkWell(
                        onTap: () {
                          setState(
                            () {
                              widget.item.count--;
                              cart.removeFromCart(widget.item);

                              if (widget.item.count == 0) {
                                addButtonClicked = false;
                              }
                            },
                          );
                        },
                        child: const Icon(
                          Icons.remove,
                          color: primaryColor,
                          size: 16,
                        ),
                      ),
                    ),
                    Container(
                      width: (widget.menuImageWidth - 20) * 0.4,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 3,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: primaryColor,
                      ),
                      child: Text(
                        '${widget.item.count}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: (widget.menuImageWidth - 20) * 0.3,
                      child: InkWell(
                        onTap: () {
                          setState(
                            () {
                              widget.item.count++;
                              cart.addToCart(widget.item);
                              if (widget.item.count == 0) {
                                addButtonClicked = false;
                              }
                            },
                          );
                        },
                        child: const Icon(
                          Icons.add,
                          color: primaryColor,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Container(
              alignment: Alignment.center,
              color: Colors.deepOrange,
              child: widget.item.isCustomizable
                  ? CustomisableButton(buttonClick: buttonClick)
                  : AddButton(buttonClick: buttonClick),
            ),
    );
  }
}

class AddButton extends StatelessWidget {
  final Function buttonClick;
  const AddButton({super.key, required this.buttonClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        buttonClick();
      },
      child: Text(
        "Add",
        style: GoogleFonts.poppins(
          textStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class CustomisableButton extends StatelessWidget {
  final Function buttonClick;
  const CustomisableButton({super.key, required this.buttonClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        buttonClick();
      },
      child: Text(
        "Customise",
        style: GoogleFonts.poppins(
          textStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
