import 'package:flutter/material.dart';
import 'package:winnerssacco/pages/loans/loans_page.dart';
import 'package:winnerssacco/pages/share_page/share_page.dart';
import 'package:winnerssacco/pages/transactions/stats_page.dart';
import 'package:get/get.dart';
import '../../../theme.dart';
import 'package:intl/intl.dart';

import '../../transactions/daily_page.dart';

class ChooseCards extends StatelessWidget {

  var f = NumberFormat("###,###", "en_US");

  List<Map<String, dynamic>> cardsData = [
    {
      "text": "Loans",
      "image": "assets/b1.png",
      "tapp": LoansPage()
    },
    {
      "text": "Transactions",
      "image": "assets/b2.png",
      "tapp": DailyPage()

    },
    {
      "text": "A/C Summary",
      "image": "assets/success.png",
      "tapp":  StatsPage()

    },
    {
      "text": "Did You Know?",
      "image": "assets/b5.png",
      "tapp":  StatsPage()

    },

  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 5,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: defaultMargin,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Our Services',
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: medium,
                ),
              ),
              IconButton(
                iconSize: 25,
                icon: const Icon(
                  Icons.arrow_forward,
                ),
                // the method which is called
                // when button is pressed
                onPressed: () {

                },
              ),
            ],
          ),
          const SizedBox(
            height: 3,
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
              itemCount: cardsData.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => _buildCard(context,cardsData[index]['image'], cardsData[index]['text'], cardsData[index]['tapp']),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildCard(BuildContext context, String image, String desc, Widget x){
 return  GestureDetector(
    onTap: (){
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => x));
    },
    child: Container(
      height: 120,
      width: 120,
      decoration:  const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      margin: const EdgeInsets.all(8),
      // color: Colors.green[700],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(child: Image.asset(image,height: 80,fit: BoxFit.cover,)),
          const SizedBox(height: 5),
           Text(
            desc,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.black),
          ),
          const SizedBox(height: 3),
        ],
      ),
    ),
  );
}
