import 'package:flutter/material.dart';
import 'package:winnerssacco/pages/auth/default_button.dart';

// This is the best practice
import '../../auth/constants.dart';
import '../../auth/size_config.dart';
import '../../auth/welcome_screen/welcome_screen.dart';
import 'onboarding_content.dart';

class BodyBoard extends StatefulWidget {
  @override
  _BodyBoardState createState() => _BodyBoardState();
}

class _BodyBoardState extends State<BodyBoard> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Winners' SACCO!\n(Your Partner In Development)\n\nEnjoy a convenient way of service\n delivery with us. Open Up Membership, \nBuy Shares, Save, Borrow and get free\n advice on financial and\n business services.",
      "image": "assets/b1.png",
  "textN":"We're Winners' SACCO"
    },
    {
      "text":
      "Everything you need is catered for! Save at the comfort of\nyour work place with our tech-equipped field agents and get\n instant digitalized receipt, message notifications, track all\nyour Savings and Loans using our App, have your queries\n answered online, apply for membership & buy shares online\nand much more. It's Winners' SACCO real digital service",
      "image": "assets/b2.png",
    "textN":"Why Winners' SACCO?"
    },
    {
      "text": "Want to Grow your Finances and Prosper? \nLook no further, Join\n Winners' SACCO, the Winning Team\n in financial and business solutions.",
      "image": "assets/b8.png",
      "textN":"Let's Win Together!"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                  textN: splashData[index]['textN'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                            (index) => buildDot(index: index),
                      ),
                    ),
                    const Spacer(flex: 1),
                    DefaultButton2(
                      text: "Continue",
                      press: () {
                        // Navigator.pushNamed(context, SignInScreen.routeName);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => WelcomeScreen()));
                      },
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? Color(0xffC2151C) : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
