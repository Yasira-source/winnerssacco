import 'package:flutter/material.dart';
import 'package:winnerssacco/pages/auth/sign_in/sign_in_screen.dart';
import 'package:winnerssacco/pages/auth/sign_up/sign_up_screen.dart';
import 'package:winnerssacco/pages/auth/size_config.dart';
import 'package:get/get.dart';
import 'constants.dart';

class HaveAccountText extends StatelessWidget {
  const HaveAccountText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "You've Used the App Before? ",
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: () =>  Get.to(()=> SignInScreen()),
          child: Text(
            "Login",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: const Color(0xffED1C24)),
          ),
        ),
      ],
    );
  }
}
