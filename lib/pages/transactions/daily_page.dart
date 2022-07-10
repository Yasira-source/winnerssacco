
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../json/daily_json.dart';
import '../../json/day_month.dart';
import '../../models/transactions_model.dart';
import '../../theme.dart';
import '../../theme/colors.dart';

import 'package:http/http.dart' as http;
class DailyPage extends StatefulWidget {


  @override
  _DailyPageState createState() => _DailyPageState();
}

class _DailyPageState extends State<DailyPage> {
  int activeDay = 3;
  String uid;
  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      uid = (prefs.getString('uid') ?? '');
    });
  }
  Future<List<TransactionsData>> fetchRelated2(String tag) async {
    final response = await http.get(Uri.parse(
        'https://winnerssacco.org/admin/api/api/loan/get_app_six_months_trans.php?id=$tag'));
    // if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    // print(jsonResponse);
    return jsonResponse.map((data) => TransactionsData.fromJson(data)).toList();
    // } else {
    //   throw Exception('Unexpected error occured!');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: const Color(0xffC2151C),
        title:  const Text(
          "Transaction",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: white),
        ),
      ),
      backgroundColor: Colors.white,
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: white, boxShadow: [
              BoxShadow(
                color: grey.withOpacity(0.01),
                spreadRadius: 10,
                blurRadius: 3,
                // changes position of shadow
              ),
            ]),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10, right: 20, left: 20, bottom: 5),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Your Last 6 Months\'  Transactions",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      // Icon(AntDesign.search1)
                    ],
                  ),

                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
                children:[
                  SizedBox(
                    height: 502,
                    child: FutureBuilder<List<TransactionsData>>(
                        future: fetchRelated2(uid),
                        builder: (context, snapshot) {
                          // print(snapshot.error);
                          if (snapshot.hasData) {
                            List<TransactionsData> data = snapshot.data;
                            return SizedBox(
                              height: 500,
                              child: ListView.builder(
                                itemCount: 5,
                                itemBuilder: (context, position) {
                                  return transactionItem(data: data[position]);
                                },
                              ),
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }),
                  ),
    ]
                )),

          const SizedBox(
            height: 15,
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 20, right: 20),
          //   child: Row(
          //     children: [
          //       const Spacer(),
          //       Padding(
          //         padding: const EdgeInsets.only(right: 80),
          //         child: Text(
          //           "Total",
          //           style: TextStyle(
          //               fontSize: 16,
          //               color: black.withOpacity(0.4),
          //               fontWeight: FontWeight.w600),
          //           overflow: TextOverflow.ellipsis,
          //         ),
          //       ),
          //       const Spacer(),
          //       const Padding(
          //         padding: EdgeInsets.only(top: 5),
          //         child: Text(
          //           "UGX 1780.00",
          //           style: TextStyle(
          //               fontSize: 20,
          //               color: black,
          //               fontWeight: FontWeight.bold),
          //           overflow: TextOverflow.ellipsis,
          //         ),
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}

Widget transactionItem({TransactionsData data}) {
  var f = NumberFormat("###,###", "en_US");
  String title;
  String amount;
  String icon;
  String ddate;
  String status;
  bool ch = true;
  ddate = data.dateCreated;
  if (data.type == "W" || data.type == "L" || data.type == "LE") {
    icon = 'assets/18.gif';
    amount = '-${f.format(int.parse(data.amount))}';
    ch =false;
    status = data.status == '1' ? 'Successful' : 'Pending';
    if (data.type == "W") {
      title = 'Withdraw Via Cashier ($status)';
    } else {
      title = 'Loan Repayment ($status)';
    }
  } else if (data.type == "A") {
    icon = 'assets/17.gif';
    amount = '+${f.format(int.parse(data.amount))}';
    status = data.status == '1' ? 'Successful' : 'Pending';

    title = '${data.reason} ($status)';
  } else if (data.type == "SMS" || data.type == "CW") {
    icon = 'assets/18.gif';
    amount = '-${f.format(int.parse(data.amount))}';
    status = data.status == '1' ? 'Successful' : 'Pending';

    title = '${data.reason} ($status)';
  } else {
    icon = 'assets/17.gif';
    amount = '+${f.format(int.parse(data.amount))}';
    status = data.status == '1' ? 'Successful' : 'Pending';
    if (data.role == "2") {
      title = 'Deposit Via Agent ($status)';
    } else {
      title = 'Deposit Via Cashier ($status)';
    }
  }

  return Container(
    padding: const EdgeInsets.all(1),
    margin: const EdgeInsets.only(
      bottom: 8,
    ),
    decoration: BoxDecoration(
      color: whiteColor,
      borderRadius: BorderRadius.circular(18),
    ),
    child: ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Image.asset(icon),
      title: Text(
        title,
        style: blackTextStyle.copyWith(
          fontSize: 16,
          fontWeight: medium,
        ),
      ),
      subtitle: Text(
        ddate,
        style: greyTextStyle.copyWith(
          fontSize: 12,
        ),
      ),
      trailing: Text(
        amount,
        style: ch
            ? blackTextStyle.copyWith(
          fontSize: 16,
        )
            : redTextStyle.copyWith(
          fontSize: 16,
        ),
      ),
    ),
  );
}