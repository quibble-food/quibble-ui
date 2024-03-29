import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:quibble/constants.dart';
import 'package:quibble/providers/cartitemsprovider.dart';
import 'package:quibble/views/homepage/homepage.dart';
import 'package:quibble/views/login/login.dart';

void main() {
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    if (kReleaseMode) exit(1);
  };
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartItemsProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: true,
        title: 'Quibble',
        routes: {
          '/home': (BuildContext context) => const HomeScreen(),
        },
        theme: ThemeData(
          fontFamily: textFontFamily,
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.deepOrange,
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: const Color(0xFFf07c63),
              ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const LoginView(),
      ),
    );
  }
}
