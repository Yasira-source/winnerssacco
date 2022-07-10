
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../sign_in/sign_in_screen.dart';
import '../sign_up/sign_up_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(238, 236, 250, 1),
      body: Column(
        children: [
          SizedBox(
            height: size.height / 10,
          ),
          Container(
            height: size.height / 3,
            width: size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/logo.png"),
                  fit: BoxFit.fitHeight),
            ),
          ),
          SizedBox(
            height: size.height / 20,
          ),
          Center(
            child: Text(
              "Welcome Back!",
              style: TextStyle(
                  fontSize: size.width / 14, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Center(
            child: Text("Winners\' SACCO App a new way ",
                style: TextStyle(
                    fontSize: size.width / 20, fontWeight: FontWeight.normal)),
          ),
          Center(
            child: Text(
              "to Connect with Customers.",
              style: TextStyle(
                  fontSize: size.width / 20, fontWeight: FontWeight.normal),
            ),
          ),
          SizedBox(
            height: size.height / 10,
          ),
          customButton(size, Colors.black, "New User",
                  () {
                Get.to(()=> SignUpScreen());
              }),
          customButton(size, const Color(0xffED1C24), "Log In", () {
            Get.to(()=> SignInScreen());
          }),
        ],
      ),
    );
  }

  Widget customButton(Size size, Color color, String text, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Material(
          color: color,
          elevation: 8,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: size.height / 12,
            width: size.width / 1.7,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: size.width / 22,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
