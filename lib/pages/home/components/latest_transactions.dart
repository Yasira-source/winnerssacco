import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:winnerssacco/models/transactions_model.dart';
import 'package:winnerssacco/pages/transactions/daily_page.dart';

import '../../../theme.dart';
import 'package:intl/intl.dart';

import 'package:http/http.dart' as http;

class LatestTransactions extends StatelessWidget {
  LatestTransactions(this.uid);
  var f = NumberFormat("###,###", "en_US");
  String uid;

  Future<List<TransactionsData>> fetchRelated(String tag) async {
    final response = await http.get(Uri.parse(
        'https://winnerssacco.org/admin/api/api/loan/get_latest_app_transactions.php?id=$tag'));
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
    Widget transactionItem({TransactionsData data}) {
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
                'Latest Transactions',
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
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => DailyPage()));
                },
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            height: 502,
            child: FutureBuilder<List<TransactionsData>>(
                future: fetchRelated('12'),
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
          // transactionItem(
          //   iconUrl: 'assets/18.gif',
          //   title: 'Withdraw (Successful)',
          //   time: 'Today, 10 AM',
          //   price: -90000.00,
          // ),
          // transactionItem(
          //   iconUrl: 'assets/17.gif',
          //   title: 'Deposit Via Cashier (Successful)',
          //   time: 'Yesterday, 4 PM',
          //   price: 30000.00,
          // ),
          // transactionItem(
          //   iconUrl: 'assets/18.gif',
          //   title: 'Withdraw (Successful)',
          //   time: '22 Jan, 2020',
          //   price: -400000.00,
          // ),
          // transactionItem(
          //   iconUrl: 'assets/17.gif',
          //   title: 'Deposit Via Agent (Pending)',
          //   time: 'Yesterday, 4 PM',
          //   price: 55000.00,
          // ),
        ],
      ),
    );
  }
}
