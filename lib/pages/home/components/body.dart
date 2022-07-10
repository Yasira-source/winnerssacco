
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:winnerssacco/pages/home/components/special_offers.dart';

import 'bank_cards.dart';
import 'choose_cards.dart';
import 'header.dart';
import 'latest_transactions.dart';

class Body2 extends StatefulWidget {

  const Body2({Key key}) : super(key: key);

  @override
  State<Body2> createState() => _Body2State();
}

class _Body2State extends State<Body2> {

  String _pname = '';
  String upname = '';
  String uid = '';
String fname;
  String accno;
String acc;
String balance;
String status;
String phone;

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      uid = (prefs.getString('uid') ?? '');
      fname = (prefs.getString('fname') ?? '');
      accno = (prefs.getString('accno') ?? '');
      acc = (prefs.getString('acc') ?? '');
      balance = (prefs.getString('balance') ?? '');
      status = (prefs.getString('status') ?? '');
      phone = (prefs.getString('phone') ?? '');

      _pname = (prefs.getString('username') ?? '');
      final x = _pname.split(" ");
      upname = x[0];
    });
  }
  @override
  Widget build(BuildContext context) {
    String greet = greeting();
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 280,
          decoration: const BoxDecoration(
            color: Color(0xffC2151C),
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(50),
            ),
          ),
        ),
        ListView(
          children: [
            _pname!=''?Header(greet,_pname):Header(greet,''),
            _pname!=''? BankCards(_pname,accno,balance,acc,status):BankCards('','','0','','0'),
            ChooseCards(),
           uid!=''? LatestTransactions(uid):Container(),
            const SizedBox(height: 20),
            const SpecialOffers(),
          ],
        ),
      ],
    );
  }

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning,';
    }
    if (hour < 17) {
      return 'Good Afternoon,';
    }
    return 'Good Evening,';
  }
}
