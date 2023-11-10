import 'package:flutter/material.dart';
import 'package:myfirst/Splash%20Screen/splash_screen.dart';

import 'package:myfirst/list.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'infrstructure/helper/admob_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AdmobHelper.initialization();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: SplashScreen(),
    );
  }
}
