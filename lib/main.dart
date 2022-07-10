import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:winnerssacco/pages/home/home_page.dart';
import 'package:winnerssacco/pages/onboarding/onboarding_page.dart';
import 'package:get/get.dart';

import 'helper/internet_connectivity/connectivity_provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
  ));
  runApp(MultiProvider(

    
      providers: [
        ChangeNotifierProvider(
          create: (context) => ConnectivityProvider(),
          child: HomePage(),
        ),
      ],
      child: GetMaterialApp(
        theme: ThemeData(
          fontFamily: 'Lato',
          primarySwatch: Colors.red,
        ),
        debugShowCheckedModeBanner: false,
        home: MyApp(),
      )));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State {
  String _pname;

  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _pname = (prefs.getString('uid') ?? '');

    });
  }
  @override
  void initState() {
    super.initState();
    _loadCounter();
    Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => OnboardingPage(_pname)),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset("assets/Comp 1_1.gif",
                gaplessPlayback: true, fit: BoxFit.fill)));
  }
}
