import 'package:flutter/material.dart';
import 'package:knowit/home.dart';
import 'package:knowit/spalsh.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool showingSplash = true;
  LoadHome() {
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        showingSplash = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    LoadHome();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Know IT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: showingSplash ? SplashScreen() : HomeScreen(),
    );
  }
}
