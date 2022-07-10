
import 'package:flutter/material.dart';

import '../../../theme.dart';

class Header extends StatelessWidget {
  Header(this.sal,this.name);
  String sal;
  String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 30,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: defaultMargin,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            sal,
            style: whiteTextStyle.copyWith(
              fontSize: 24,
              fontWeight: medium,
            ),
          ),
          Text(
            '$name!',
            style: whiteTextStyle.copyWith(
              fontSize: 16,
              fontWeight: light,
            ),
          ),
        ],
      ),
    );
  }
}