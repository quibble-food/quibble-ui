import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionLine extends StatelessWidget {
  const QuestionLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text("What are you in mood for?",
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 20,
                    fontWeight: FontWeight.w500))),
        const Spacer(),
        TextButton(
          style: ButtonStyle(
              alignment: Alignment.center,
              backgroundColor:
                  MaterialStatePropertyAll(Colors.purple.shade400)),
          child: const Text("See all", style: TextStyle(color: Colors.white)),
          onPressed: () {
            // Offer function call
          },
        )
      ],
    );
  }
}
