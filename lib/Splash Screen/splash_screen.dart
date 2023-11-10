import 'package:flutter/material.dart';

import 'package:myfirst/list.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    // Simulate a delay for the splash screen
    Future.delayed(Duration(seconds: 2), () {
      // Navigate to the next screen (HomeScreen) using Navigator
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Listt()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset("assets/images/logos.png"),
              width: 200,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
