import 'package:flutter/material.dart';

import '../../auth/constants.dart';
import '../../auth/size_config.dart';


class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key,
    this.text,
    this.image,
    this.textN
  }) : super(key: key);
  final String text, image,textN;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Spacer(),
        Text(
          textN,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(20),
            color: Color(0xffC2151C),
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
        const Spacer(flex: 2),
        Image.asset(
          image,
          height: getProportionateScreenHeight(250),
          width: getProportionateScreenWidth(235),
          // fit: BoxFit.fitHeight,
        ),
      ],
    );
  }
}
