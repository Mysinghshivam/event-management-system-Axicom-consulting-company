import 'package:event_management_system/screens/client/clientevent.dart';
import 'package:event_management_system/screens/client/clienthome.dart';
import 'package:event_management_system/screens/client/clientprofile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClientHomeScreen extends StatefulWidget {
  const ClientHomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ClientHomeScreen> {
  int currentIndex = 0; // default homepage
  final screens = [ClientHome(), ClientEvent(), Clientprofile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex], //body move to correct page
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blueAccent,
          selectedItemColor: Colors.white,
          unselectedItemColor: Color.fromARGB(200, 135, 206, 235),
          // showSelectedLabels: false,
          iconSize: 25,
          // selectedFontSize: 20,
          // unselectedFontSize: 15,
          currentIndex: currentIndex, //to select the icons
          onTap: (index) => setState(() => currentIndex = index),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.blueAccent,
              //     onPressed: () {
              //   HomeScreen();
              // },
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.analytics_rounded),
              label: 'Events',
              backgroundColor: Colors.blueAccent,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile', // import 'dart:ui';

              backgroundColor: Colors.blueAccent,
            ),
          ]),
    );
  }
}
