import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class PhoneValidation extends StatelessWidget {
  final String phoneNumber;
  const PhoneValidation({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    void validateOtp() {
      Navigator.of(context).pushNamedAndRemoveUntil(
        '/home',
        (route) => false,
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          'OTP',
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w500)),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 100.0,
              left: 20.0,
              right: 20.0,
              bottom: 30.0,
            ),
            child: Row(
              children: [
                const Text('Is the number correct: '),
                Text(
                  '+91 $phoneNumber',
                  style: const TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            child: Expanded(
              child: Form(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 68,
                      width: 64,
                      child: TextFormField(
                        style: TextStyle(
                          color: Colors.purple.shade400,
                          decorationColor: Colors.purple.shade400,
                        ),
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        onSaved: (pin1) {},
                        decoration: InputDecoration(
                          focusColor: Colors.purple.shade400,
                          fillColor: Colors.purple.shade400,
                          hintText: "0",
                        ),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 68,
                      width: 64,
                      child: TextFormField(
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        onSaved: (pin2) {},
                        decoration: InputDecoration(
                          focusColor: Colors.purple.shade400,
                          hintText: "0",
                        ),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 68,
                      width: 64,
                      child: TextFormField(
                        style: TextStyle(color: Colors.purple.shade400),
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        onSaved: (pin3) {},
                        decoration: InputDecoration(
                          focusColor: Colors.purple.shade400,
                          hintText: "0",
                        ),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 68,
                      width: 64,
                      child: TextFormField(
                        onChanged: (value) {
                          if (value.length == 1) {
                            validateOtp();
                          }
                        },
                        onSaved: (pin4) {},
                        decoration: InputDecoration(
                          focusColor: Colors.purple.shade400,
                          hintText: "0",
                        ),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          SizedBox(
            height: 45.0,
            width: 200.0,
            child: Material(
              borderRadius: BorderRadius.circular(25.0),
              color: Colors.orange.shade700,
              shadowColor: Colors.orangeAccent,
              elevation: 7.0,
              child: GestureDetector(
                onTap: () {
                  validateOtp();
                },
                child: const Center(
                  child: Text(
                    "Verify",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
