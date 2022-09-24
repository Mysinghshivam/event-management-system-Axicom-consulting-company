import 'package:event_management_system/screens/client/eventhistory.dart';
import 'package:event_management_system/screens/client/newevent.dart';
import 'package:flutter/material.dart';

class ClientEvent extends StatefulWidget {
  _ClientState createState() => _ClientState();
}

class _ClientState extends State<ClientEvent> {
  int currentIndex = 0; // default homepage
  final screens = [ClientNewEvent(), ClientEventHistory()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.add),
        title: Center(child: Text("Events")),
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
