import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:winnerssacco/pages/accounts_page/components/bpdy.dart';

import 'package:get/get.dart';

class Account extends StatefulWidget {
  Account({Key key}) : super(key: key);
  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  static String routeName = "/profile";
  String _pname = '';
  String upname = '';
  String uid = '';
  String email = '';

  @override
  void initState() {
    super.initState();
    _loadCounterx();
  }

  _loadCounterx() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      uid = (prefs.getString('uid') ?? '');
      _pname = (prefs.getString('username') ?? '');
      email = (prefs.getString('email') ?? '');
      final x = _pname.split(" ");
      upname = x[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: Bodyn()),
    );
  }
}
