
import 'package:event_management_system/screens/staff/staffevent.dart';
import 'package:event_management_system/screens/staff/staffhome.dart';
import 'package:event_management_system/screens/staff/staffprofile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StaffHomeScreen extends StatefulWidget {
  const StaffHomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<StaffHomeScreen> {
  // User? doctor = FirebaseAuth.instance.currentUser;
  // DoctorUserModel loggedInUser = DoctorUserModel();

  int currentIndex = 0; // default homepage
  final screens = [StaffHome(), StaffEvent(), StaffProfile()];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Home Screen"),
      //   centerTitle: true,
      // ),
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
