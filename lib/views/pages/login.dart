import 'package:flutter/material.dart';
import 'package:quibble/views/pages/phonevalidation.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String phoneNumber = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        reverse: true, // this is new
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 650,
            ),
            Container(
              padding:
                  const EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: Column(
                children: [
                  const Text(
                    "Phone Number",
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        phoneNumber = value;
                      });
                    },
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      prefixText: "+91 ",
                      fillColor: Color.fromARGB(255, 242, 241, 241),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      contentPadding: EdgeInsets.only(
                        left: 20.0,
                        right: 20.0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  SizedBox(
                    height: 45.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.orange,
                      shadowColor: Colors.orangeAccent,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PhoneValidation(),
                            ),
                          );
                        },
                        child: const Center(
                          child: Text(
                            "LOGIN",
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
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
            )
          ],
        ),
      ),
    );
  }
}
