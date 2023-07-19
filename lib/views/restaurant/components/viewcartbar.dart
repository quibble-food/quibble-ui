import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quibble/constants.dart';

import '../../../providers/cartitemsprovider.dart';

class ViewCartBar extends StatefulWidget {
  ViewCartBar({
    super.key,
  });

  @override
  State<ViewCartBar> createState() => _ViewCartBarState();
}

class _ViewCartBarState extends State<ViewCartBar> {
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Consumer<CartItemsProvider>(
      builder: (context, cart, child) => Material(
          child: InkWell(
        onTap: () {
          //print('called on tap');
        },
        child: Container(
          height: cart.cartItemCount != 0 ? screen.height * 0.07 : 0,
          margin: EdgeInsets.symmetric(
              horizontal: screen.width * 0.03, vertical: screen.height * 0.03),
          decoration: BoxDecoration(
              color: primaryColor, borderRadius: BorderRadius.circular(10)),
          width: screen.width * 0.7,
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.only(
                left: screen.width * 0.02,
              ),
              child: Text('${cart.cartItemCount} items | ₹ ${cart.total}',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  )),
            )
          ]),
        ),
      )),
    );
  }
}
