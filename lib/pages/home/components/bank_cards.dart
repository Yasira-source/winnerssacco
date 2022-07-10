
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../theme.dart';

class BankCards extends StatelessWidget {
  BankCards(this.names,this.acc_no,this.balance,this.acc,this.status);
  String names,acc,acc_no,balance,status;

  // var f = NumberFormat("###,###", "en_US");
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(width: defaultMargin),
            _buildCreditCard(context,
                color: const Color(0xFF000000),
                cardExpiration: "05/2024",
                balance: balance,
                acc: acc,
                status: int.parse(status)==1? 'ACTIVE':'PENDING',
                cardHolder: names,
                cardNumber: acc_no),

            // SizedBox(width: 20),
            // Image.asset(
            //   'assets/image_card.png',
            //   height: 210,
            // ),
            SizedBox(
              width: defaultMargin,
            ),
          ],
        ),
      ),
    );
  }
}

// Build the top row containing logos
Row _buildLogosBlock() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Image.asset(
        "assets/contact_less.png",
        height: 20,
        width: 18,
      ),
      Image.asset(
        "assets/mastercard.png",
        height: 50,
        width: 50,
      ),
    ],
  );
}
// Build the credit card widget
Card _buildCreditCard(BuildContext context,
    {@required Color color,
      String balance,
      String acc,
      String status,
      @required String cardNumber,
      @required String cardHolder,
      @required String cardExpiration}) {
  var f = NumberFormat("###,###", "en_US");
  return Card(
    elevation: 4.0,
    color: color,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(14),
    ),
    child: Container(
      height: 200,
      width: MediaQuery.of(context).size.width*0.9,
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 22.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // _buildLogosBlock(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  '$cardNumber',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontFamily: 'CourrierPrime'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  <Widget>[
                    const Text(
                      'A/C - STATUS',
                      style: TextStyle(
                          color: Colors.grey, fontSize: 9, fontWeight: FontWeight.bold),
                    ),
                    Text(
                     status,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Color(0xFF1A8F00), fontSize: 15, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          ),

          _buildDetailsBlock(
            label: 'A/C - BALANCE',
            value: 'UGX ${f.format(int.parse(balance))}',
          ),
          _buildDetailsBlock(
            label: 'A/C - TYPE',
            value: acc,
          ),


              _buildDetailsBlock(
                label: 'A/C - NAMES',
                value: cardHolder,
              ),

        ],
      ),
    ),
  );
}






// Build Column containing the cardholder and expiration information
Column _buildDetailsBlock({@required String label, @required String value}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        '$label',
        style: const TextStyle(
            color: Colors.grey, fontSize: 11, fontWeight: FontWeight.bold),
      ),
      Text(
        '$value',
          maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
            color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
      )
    ],
  );
}
