
import 'package:flutter/material.dart';
import 'package:winnerssacco/pages/auth/welcome_screen/welcome_screen.dart';
import 'package:winnerssacco/pages/onboarding/onboarding_page_second.dart';


import '../../theme.dart';


class OnboardingPage extends StatelessWidget {
  OnboardingPage(this.pname);
  String pname;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // const Color(0xffED1C24)
      backgroundColor: const Color(0xffC2151C),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Positioned(
              bottom: -20,
              left: -60,
              child: Image.asset(
                'assets/image_hand.png',
                width: 250,
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(
                  //   height: 80,
                  // ),
                  Image.asset(
                    'assets/16.gif',
                    width: 355,
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Text(
                    'Your Partner In Development',
                    style: whiteTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'What can we say if there is an app\nthat you can use to manage your\n SACCO account anywhere you\'re?\n Promising',
                    style: whiteTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: light,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {

                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => pname==""?SplashScreen():WelcomeScreen()));
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 48,
                            vertical: 14,
                          ),
                          decoration: const BoxDecoration(
                            color: Color(0XFF000000),
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(20),
                            ),
                          ),
                          child: Text(
                            'OK, BRING ME IN',
                            style: blackTextStyle.copyWith(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: medium,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
