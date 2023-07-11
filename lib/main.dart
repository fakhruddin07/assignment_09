import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Roboto",
        textTheme: const TextTheme(
          headlineMedium: TextStyle(color: Colors.white, fontFamily: "Roboto"),
          headlineSmall: TextStyle(color: Colors.white, fontFamily: "Roboto", fontSize: 20),
        ),
      ),
      home: const HomePage(),
    );
  }
}
