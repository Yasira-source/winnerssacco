import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:winnerssacco/pages/accounts_page/components/profile_menu.dart';
import 'package:winnerssacco/pages/accounts_page/components/profile_pic.dart';
import 'package:winnerssacco/pages/updates_page/updates_page_2.dart';

import '../../auth/forgot_password/forgot_password.dart';
import '../../auth/sign_in/sign_in_screen.dart';


class Bodyn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const ProfilePic(),
          const SizedBox(height: 20),
          ProfileMenu(
            text: "Change mPIN",
            icon: "assets/User Icon.svg",
            press: ()  {
            Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>  ForgotPasswordScreen(
            )));
            },
          ),
          ProfileMenu(
            text: "Nearby Branches",
            icon: "assets/Question mark.svg",
            press: () {
              final url ="https://www.google.com/maps/dir/0.3079514,32.5712095/bbc+building+kampala/@0.3113649,32.5702375,17z/data=!3m1!4b1!4m9!4m8!1m1!4e1!1m5!1m1!1s0x177dbc825e0641f7:0x51101f0cd4f99d0e!2m2!1d32.5742245!2d0.3149075";
           if( canLaunch(url) != null){
              launch(url,forceSafariVC: false,forceWebView: false,enableJavaScript: true);
              }
            },
          ),
          ProfileMenu(
            text: "Privacy Policy",
            icon: "assets/Settings.svg",
            press: () {
              final url ="https://winnerssacco.org/website/privacy_policy.php";
              if( canLaunch(url) != null){
                launch(url,forceSafariVC: false,forceWebView: false,enableJavaScript: true);
              }
            },
          ),
          ProfileMenu(
            text: "Terms of Use",
            icon: "assets/Cash.svg",
            press: () {
              final url ="https://winnerssacco.org/website/privacy_policy.php";
              if( canLaunch(url) != null){
                launch(url,forceSafariVC: false,forceWebView: false,enableJavaScript: true);
              }
            },
          ),
          ProfileMenu(
            text: "Notifications",
            icon: "assets/Bell.svg",
            press: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>  UpdatesPage2(
                  )));
            },
          ),
          ProfileMenu(
            text: "Report a Bug",
            icon: "assets/Bell.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/Log out.svg",
            press: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>  SignInScreen(
                  )));
            },
          ),
        ],
      ),
    );
  }
}
