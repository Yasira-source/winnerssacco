import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:winnerssacco/pages/home/home_page.dart';
import 'package:winnerssacco/pages/loans/check_your%20loan_status.dart';
import 'package:winnerssacco/pages/loans/style.dart';

import 'package:http/http.dart' as http;
import '../../theme/colors.dart';
import 'loan_statement.dart';
class LoansPage extends StatefulWidget {

  @override
  State<LoansPage> createState() => _LoansPageState();
}

class _LoansPageState extends State<LoansPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFFEFEFE),
      appBar: AppBar(

        backgroundColor: const Color(0xffC2151C),
        title:  Text(
          "Loans",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: white),
        ),
        actions: [
          IconButton(
              onPressed: () {

              },
              icon: const Icon(Icons.search_outlined)),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _title('Our Loan Services'),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _menuItem('Check your\nloan status', FontAwesomeIcons.dollarSign,
                    blueGradient,(){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>  LoanStatus(uid: uid
                          )));
                    }),
                _menuItem('Check your\nOutstanding Balance', FontAwesomeIcons.cashRegister,
                    darkRedGradient,(){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>  LoanStatus(uid: uid
                          )));
                    }),
                _menuItem('Request Loan\nStatement', FontAwesomeIcons.envelopeOpen,
                    tealGradient,(){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>  LoanStatement(uid: uid
                          )));
                    }),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _menuItem('Request Loan\nSchedule', FontAwesomeIcons.coins, yellowGradient,() async{
                  await http.get(Uri.parse('https://winnerssacco.org/admin/api/api/loan/requests_app.php?id=$uid&reason="Loan Schedule"'));
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>  HomePage(
                      )));
                }),
                _menuItem('Request for\nExemption', FontAwesomeIcons.gift, redGradient,() async{
                  await http.get(Uri.parse('https://winnerssacco.org/admin/api/api/loan/requests_app.php?id=$uid&reason="Loan Exemption"'));
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>  HomePage(
                      )));
                }),
                _menuItem(
                    'Request for\n a Call Back', FontAwesomeIcons.phoneAlt, purpleGradient,() async{
                  await http.get(Uri.parse('https://winnerssacco.org/admin/api/api/loan/requests_app.php?id=$uid&reason="Loan Call Back"'));
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>  HomePage(
                      )));
                }),
              ],
            ),

            const SizedBox(height: 12),
            // _title('Special Pomotions'),
            // const SizedBox(height: 12),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: <Widget>[
            //     _promotionCard('Affordable Loan rates', 'assets/10.gif'),
            //     _promotionCard('Favourable Repayment Plans', 'assets/8.gif'),
            //   ],
            // ),
            // SizedBox(height: 48),
          ],
        ),
      ),
    );
  }


  _menuItem(String title, IconData iconData, LinearGradient gradient,Function x) {
    return GestureDetector(
      onTap: x,
      child: Container(
        height: MediaQuery.of(context).size.width * 0.35,
        width: MediaQuery.of(context).size.width * 0.26,
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 2,
              blurRadius: 2,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: gradient,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(iconData, size: 24, color: Colors.white),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

  _title(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.blueGrey[900],
      ),
    );
  }

}
