import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quibble/models/food.dart';
import 'package:quibble/views/restaurant/restaurant.dart';

class RestaurantCard extends StatefulWidget {
  final FoodItem foodItem;
  const RestaurantCard({super.key, required this.foodItem});

  @override
  State<RestaurantCard> createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return Restaurant(
                restaurant: widget.foodItem.restaurant,
              );
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.foodItem.name,
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '₹',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                      color: Color.fromARGB(255, 3, 244, 11),
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    )),
                  ),
                  TextSpan(
                    text: "${widget.foodItem.price}",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
