import 'package:flutter/material.dart';
import 'package:winnerssacco/pages/auth/sign_up/sign_up_screen.dart';
import 'package:winnerssacco/pages/auth/size_config.dart';
import 'package:get/get.dart';
import 'constants.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Never Used the App Before? ",
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: () =>  Get.to(()=> SignUpScreen()),
          child: Text(
            "Sign Up",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: const Color(0xffED1C24)),
          ),
        ),
      ],
    );
  }
}
