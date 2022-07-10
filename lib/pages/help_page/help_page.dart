import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
class HelpPage extends StatefulWidget {
  const HelpPage({ Key key }) : super(key: key);

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40,),
            Center(
              child: Column(
                children:const [
                  SizedBox(height: 60,),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50,
                    backgroundImage: AssetImage("assets/contact.gif"),
                    // child: Image.asset("assets/images/ic_launcher.png"), //Text
                  ),
                  SizedBox(height: 5,),
                  Text("WINNERS' SACCO",style: TextStyle(fontSize: 20, color: Colors.black),),
                  SizedBox(width: 200,child: Divider(color: Color(0xfffc0876),)),
                  Text("HELP DESK",style: TextStyle(fontSize: 20, color: Colors.black),),
                ],
              ),
              //CircleAvatar
            ),

            const SizedBox(height: 20,),
            GestureDetector(
              onTap: (){

          final Uri launchUri = Uri(
            scheme: 'tel',
            path: '+256774016670',
          );
           launchUrl(launchUri);

              },
              child: const Card(
                child: ListTile(
                  leading: Icon(Icons.call,color: Color(0xffC2151C) ,),
                  title: Text('+256-774016670'),
                ),
              ),
            ),

            const SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                String encodeQueryParameters(Map<String, String> params) {
                  return params.entries
                      .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                      .join('&');
                }
                final Uri emailLaunchUri = Uri(
                  scheme: 'mailto',
                  path: 'customercare@winnerssacco.org',
                  query: encodeQueryParameters(<String, String>{
                    'subject': 'WINNERS\' SACCO APP '
                  }),
                );

                launchUrl(emailLaunchUri);
              },
              child: const Card(
                child: ListTile(
                  leading: Icon(Icons.mail,color: Color(0xffC2151C) ,),
                  title: Text('customercare@winnerssacco.org'),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                if( canLaunch(openWhatsapp()) != null){
                  launch(openWhatsapp());
                }
               else {
                throw 'Could not launch ${openWhatsapp()}';
                }
              },
              child: Card(
                child: ListTile(
                  leading: Image.asset("assets/whats.png",width: 20,height: 20,),
                  title: const Text('Whatsapp - Us'),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                final url ="https://winnerssacco.org/index.php";
                if( canLaunch(url) != null){
                  launch(url);
                }
                else {
                  throw 'Could not launch $url';
                }
              },
              child: Card(
                child: ListTile(
                  leading: Image.asset("assets/logo.png",width: 20,height: 20,),
                  title: const Text('Visit Our Website'),
                ),
              ),
            ),
            const SizedBox(height:15),
            const Center(
              child:Text("Thank you for Saving With Us!\nWe Pledge to Continue Offering you\nthe best Financial Services"),
            ),
          ],
        ),
      ),
    );
  }

  openWhatsapp() {
var phone = "+256774016670";
var message ="Hello, Winners' SACCO APP";
if (Platform.isAndroid) {
  // add the [https]
  return "https://wa.me/$phone/?text=${Uri.parse(message)}"; // new line
} else {
  // add the [https]
  return "https://api.whatsapp.com/send?phone=$phone=${Uri.parse(message)}"; // new line
}
  }
}