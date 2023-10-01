import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quibble/models/food.dart';
import 'package:quibble/providers/cartitemsprovider.dart';
import 'package:quibble/views/icons/vegnonveg.dart';
import 'package:quibble/views/restaurant/components/addtocart.dart';
import 'package:quibble/views/restaurant/components/foodimage.dart';

class FoodItemCard extends StatefulWidget {
  final FoodItem foodItemProps;
  @override
  const FoodItemCard({super.key, required this.foodItemProps});

  @override
  State<FoodItemCard> createState() => _FoodItemCardState();
}

class _FoodItemCardState extends State<FoodItemCard> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final menuImageHeight = screenSize.height * 0.25;
    final menuImageWidth = screenSize.width * 0.3;
    final cart = Provider.of<CartItemsProvider>(context);

    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 0,
            bottom: 10,
          ),
          padding: const EdgeInsets.only(bottom: 10),
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(
              color: Colors.black12,
              width: 1.0,
            )),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(
                    top: 20,
                    left: 5,
                    right: 5,
                    bottom: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      widget.foodItemProps.veg
                          ? const IconVeg()
                          : const IconNonVeg(),
                      Text(
                        widget.foodItemProps.name,
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Text(
                        "₹ ${widget.foodItemProps.price}",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 100,
                child: Stack(
                  children: [
                    FoodImage(
                      imageUrl: widget.foodItemProps.imageUrl,
                      menuImageHeight: menuImageHeight,
                      menuImageWidth: menuImageWidth,
                    ),
                    Positioned(
                      height: 40,
                      bottom: 0,
                      child: AddToCartButton(
                        item: widget.foodItemProps,
                        menuImageWidth: menuImageWidth,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
