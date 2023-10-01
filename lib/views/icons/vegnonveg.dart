import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double squareSize = 36;
const double iconSize = 14;

class IconVeg extends StatelessWidget {
  const IconVeg({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: const [
        Icon(
          Icons.crop_square_sharp,
          color: Colors.green,
          size: squareSize,
        ),
        Icon(
          Icons.circle,
          color: Colors.green,
          size: iconSize,
        ),
      ],
    );
  }
}

class IconNonVeg extends StatelessWidget {
  const IconNonVeg({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: const [
        Icon(
          Icons.crop_square_sharp,
          color: Colors.red,
          size: squareSize,
        ),
        Icon(
          IconData(
            0xf56f,
            fontFamily: CupertinoIcons.iconFont,
            fontPackage: CupertinoIcons.iconFontPackage,
          ),
          color: Colors.red,
          size: iconSize,
        ),
      ],
    );
  }
}
