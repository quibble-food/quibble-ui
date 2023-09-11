import 'package:flutter/material.dart';
import 'package:quibble/providers/cartitemsprovider.dart';
import 'package:quibble/views/icons/vegnonveg.dart';
import 'package:quibble/views/restaurant/components/addtocart.dart';

class CartItemCard extends StatefulWidget {
  final CartItem cartItem;
  const CartItemCard({super.key, required this.cartItem});

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  @override
  Widget build(BuildContext context) {
    final item = widget.cartItem.foodItem;
    final count = widget.cartItem.count;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              item.veg ? const IconVeg() : const IconNonVeg(),
              Column(
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        AddToCartButton(item: item, menuImageWidth: 100),
        SizedBox(
          width: 45,
          child: Text(
            '₹${count * item.price}',
            textAlign: TextAlign.end,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }
}
