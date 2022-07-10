
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class SharePage extends StatefulWidget {
  const SharePage({Key key}) : super(key: key);

  @override
  State<SharePage> createState() => _SharePageState();
}

class _SharePageState extends State<SharePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Center(
              child: Column(
                children: const [
                  SizedBox(height: 60),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50,
                    backgroundImage: AssetImage("assets/ic_launcher.png"),
                    // child: Image.asset("assets/images/ic_launcher.png"), //Text
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "WINNERS' SACCO CLIENT'S APP",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
//  Divider(color: Color(0xfffc0876),),

                  SizedBox(
                      width: 200,
                      child: Divider(
                        color: Color(0xfffc0876),
                      )),
                  Text(
                    "REFERRAL LINK",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ],
              ),
              //CircleAvatar
            ),
            const SizedBox(
              height: 20,
            ),
            const Card(
              child: ListTile(
                leading: Icon(
                  Icons.download,
                  color: Color(0xfffc0876),
                ),
                title: Text('Available on Google Play Store'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: (){
                final url ="https://play.google.com/store/apps/details?id=com.educan.educanapp";
               Share.share(url);
              },
              child: const Card(
                color: Color(0xffC2151C),
                child: ListTile(
                  leading: Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Share App',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Center(
              child: Text(
                  "Thank you for Saving With Us!\n       Your Partner in Development\n"),
            ),
          ],
        ),
      ),
    );
  }
}
