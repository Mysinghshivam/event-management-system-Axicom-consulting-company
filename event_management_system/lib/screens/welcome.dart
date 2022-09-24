import 'package:event_management_system/screens/client/login_screen.dart';
import 'package:event_management_system/screens/staff/login_screen.dart';
import 'package:flutter/material.dart';
//import 'package:event_management_system/screens/doctor/login_screen.dart';
import 'package:event_management_system/screens/manager/login_screen.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final managerButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blueAccent,
      child: MaterialButton(
          minWidth: 200.0,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ManagerLoginScreen()),
            );
          },
          child: Text(
            "Manager",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
    final clientButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blueAccent,
      child: MaterialButton(
          minWidth: 200.0,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ClientLoginScreen()),
            );
          },
          child: Text(
            "Client",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
    final staffButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blueAccent,
      child: MaterialButton(
          minWidth: 200.0,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StaffLoginScreen()),
            );
          },
          child: Text(
            "Staff",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.fromLTRB(30.0, 80.0, 10.0, 30.0),
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // SizedBox(height: 25),
                  Text(
                    "Welcome to EMS",
                    style: TextStyle(
                        fontSize: 30.0,
                        foreground: Paint()
                          ..style = PaintingStyle.fill
                          ..strokeWidth = 6
                          ..color = Colors.blue),
                  ),
                  SizedBox(height: 45),
                  SizedBox(
                      height: 200,
                      child: Image.asset(
                        "assets/logo.png",
                        fit: BoxFit.contain,
                      )),

                  SizedBox(height: 35),
                  Text(
                    "Are you a? ",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(height: 20),
                  managerButton,
                  SizedBox(height: 25),
                  clientButton,
                  SizedBox(height: 25),
                  staffButton,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
