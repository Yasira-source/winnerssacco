import 'package:flutter/material.dart';

import '../auth/size_config.dart';
import 'components/body_boarding.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(238, 236, 250, 1),
      body: BodyBoard(),
    );
  }
}
