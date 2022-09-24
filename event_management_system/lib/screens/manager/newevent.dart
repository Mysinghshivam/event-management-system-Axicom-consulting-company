import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ManagerNewEvent extends StatefulWidget {
  @override
  _ManagerNewEventState createState() => _ManagerNewEventState();
}

class _ManagerNewEventState extends State<ManagerNewEvent> {
  User? user = FirebaseAuth.instance.currentUser;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  var _eid = "";
  var _name = "";
  var _phone = "";
  var _email = "";
  var _event = "";
  var _date = "";
  var _budget = "";
  var _address = "";
  var _others = "";

  @override
  void initState() {
    super.initState();
    firebaseFirestore.collection("events").doc().get().then((value) {
      setState(() {
        _eid = value.data()!["id"];
        _name = value.data()!["name"];
        _phone = value.data()!["phone"];
        _email = value.data()!["email"];
        _event = value.data()!["eventName"];
        _date = value.data()!["date"];
        _budget = value.data()!["budget"];
        _address = value.data()!["address"];
        _others = value.data()!["others"];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center();
  }
}
