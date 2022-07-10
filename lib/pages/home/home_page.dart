import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:winnerssacco/pages/help_page/help_page.dart';
import 'package:winnerssacco/pages/home/components/body.dart';
import 'package:winnerssacco/pages/share_page/share_page.dart';
import 'package:winnerssacco/pages/updates_page/updates_page.dart';
import 'package:winnerssacco/pages/updates_page/updates_page_2.dart';

import '../../helper/internet_connectivity/connectivity_provider.dart';
import '../../helper/internet_connectivity/no_internet.dart';
import '../../theme.dart';
import '../accounts_page/account_page.dart';


class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<ConnectivityProvider>(context, listen: false).startMonitoring();
  }
  // static String routeName = "/home";
  int index = 0;

  final screens = [
   Body2(),
    Account(),
    HelpPage(),
    UpdatesPage(),
    SharePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FBFB),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xffC2151C),
        title:  Center(
          child: Text('WINNERS\' SACCO CLIENTS\' APP', style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: bold,
          ),),
        ),
        actions: [

          Stack(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => UpdatesPage2()));
                  },
                  icon: const Icon(Icons.notifications)),
             Positioned(
                    top: 0,
                    right: 6,
                    child:
                         Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: const Text(
                        '2',
                        style: TextStyle(fontSize: 12,color: Color(0xffC2151C)),
                      ),
                    )),

            ],
          )
        ],
      ),

      body:screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: const Color(0xffC2151C),
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        child: NavigationBar(
            height: 60,
            backgroundColor: Colors.white,
            selectedIndex: index,
            animationDuration: const Duration(seconds: 3),
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.account_circle_outlined),
                selectedIcon: Icon(
                  Icons.account_circle,
                  color: Colors.white,
                ),
                label: 'Account',
              ),

              NavigationDestination(
                icon: Icon(Icons.help),
                selectedIcon: Icon(
                  Icons.help,
                  color: Colors.white,
                ),
                label: 'Help',
              ),
              NavigationDestination(
                icon: Icon(Icons.tips_and_updates_outlined),
                selectedIcon: Icon(Icons.tips_and_updates,color: Colors.white,),
                label: 'Events',
              ),

              NavigationDestination(
                icon: Icon(
                  Icons.share_outlined,
                  size: 30,
                ),
                selectedIcon: Icon(
                  Icons.share,
                  size: 30,
                  color: Colors.white,
                ),
                label: 'Share',
              ),
            ]),
      ),
    );
  }

  Widget pageUI() {
    return Consumer<ConnectivityProvider>(
      builder: (consumerContext, model, child) {
        if (model.isOnline != null) {
          return model.isOnline
              ? screens[index]
              : NoInternet();
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
