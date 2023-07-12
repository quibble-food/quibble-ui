import 'package:flutter/material.dart';

class FoodImage extends StatefulWidget {
  final String imageUrl;
  final double menuImageHeight;
  final double menuImageWidth;
  const FoodImage(
      {super.key,
      required this.imageUrl,
      required this.menuImageHeight,
      required this.menuImageWidth});

  @override
  State<FoodImage> createState() => _FoodImageState();
}

class _FoodImageState extends State<FoodImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 40),
      height: widget.menuImageHeight,
      width: widget.menuImageWidth,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 0),
                blurRadius: 60,
                color: Colors.grey.shade400.withOpacity(0.33))
          ]),
      child: Image.asset(
        widget.imageUrl,
        height: widget.menuImageHeight,
        width: widget.menuImageWidth,
      ),
    );
  }
}
