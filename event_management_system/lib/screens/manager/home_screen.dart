import 'package:event_management_system/screens/manager/managerevent.dart';
import 'package:event_management_system/screens/manager/managerhome.dart';
import 'package:event_management_system/screens/manager/managerprofile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ManagerHomeScreen extends StatefulWidget {
  const ManagerHomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ManagerHomeScreen> {
  // User? doctor = FirebaseAuth.instance.currentUser;
  // DoctorUserModel loggedInUser = DoctorUserModel();

  int currentIndex = 0; // default homepage
  final screens = [ManagerHome(), ManagerEvent(), ManagerProfile()];

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
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.analytics_rounded),
              label: 'Events',
              backgroundColor: Colors.blueAccent,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile', // import 'dart:ui';
              backgroundColor: Colors.purple,
            ),
          ]),
    );
  }
}
