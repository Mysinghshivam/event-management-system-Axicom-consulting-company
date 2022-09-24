import 'package:event_management_system/screens/manager/eventhistory.dart';
import 'package:event_management_system/screens/manager/newevent.dart';
import 'package:flutter/material.dart';

class ManagerEvent extends StatefulWidget {
  _ManagerState createState() => _ManagerState();
}

class _ManagerState extends State<ManagerEvent> {
  int currentIndex = 0; // default homepage
  final screens = [ManagerNewEvent(), ManagerEventHistory()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.add),
        // title: Center(child: Text("Events")),
        actions: [
          Icon(Icons.history),
          Padding(padding: EdgeInsets.symmetric(horizontal: 10))
        ],
        backgroundColor: Colors.blueAccent,
      ),
      body: screens[currentIndex],
    );
  }
}
