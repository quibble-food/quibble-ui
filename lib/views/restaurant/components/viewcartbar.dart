import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quibble/constants.dart';
import 'package:quibble/views/homepage/homepage.dart';

import '../../../providers/cartitemsprovider.dart';

class ViewCartBar extends StatefulWidget {
  const ViewCartBar({super.key});

  @override
  State<ViewCartBar> createState() => _ViewCartBarState();
}

class _ViewCartBarState extends State<ViewCartBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartItemsProvider>(
      builder: (__, cart, child) => Material(
        child: InkWell(
          onTap: () {
             Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
          child: Container(
            height: 60,
            margin: const EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 40,
            ),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      '${cart.cart.length} Items | ₹ ${cart.total}',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  'View Cart',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
