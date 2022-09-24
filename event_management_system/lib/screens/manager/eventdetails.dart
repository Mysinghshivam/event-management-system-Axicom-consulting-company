import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EventDetails extends StatefulWidget {
  final docId;
  const EventDetails(this.docId);

  @override
  _EventDetailsState createState() => _EventDetailsState(docId);
}

class _EventDetailsState extends State<EventDetails> {
  final docId;
  _EventDetailsState(this.docId);
  User? user = FirebaseAuth.instance.currentUser;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  var _id = "";
  var _name = "";
  var _phone = "";
  var _email = "";
  var _event = "";
  var _date = "";
  var _budget = "";
  var _address = "";
  var _others = "";



//getting user appointment data
  @override
  void initState() {
    super.initState();
    firebaseFirestore.collection("events").doc(docId).get().then((value) {
      setState(() {
        _id = value.data()!["id"];
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
    return Scaffold(
        appBar: AppBar(
          title: Text('Event Details'),
          titleSpacing: 00.0,
          centerTitle: true,
          toolbarHeight: 100.2,
          toolbarOpacity: 0.8,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          )),
          elevation: 0.00,
          backgroundColor: Colors.blueAccent
        ),
        body: Center(
            child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                backgroundColor: Colors.grey.shade800,
                backgroundImage: AssetImage('assets/logo.png'),
                radius: 60,
                ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, right: 40),
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(70, 155, 39, 176),
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            " Event Name: ",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: 60,
                          ),
                          Flexible(
                            child: Text(
                              _name,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, right: 40),
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(70, 155, 39, 176),
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            " Event ID: ",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Flexible(
                            child: Text(
                              _id,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, right: 40),
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(70, 155, 39, 176),
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            " Phone: ",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Flexible(
                            child: Text(
                              _phone,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 40.0, right: 40),
                    child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(70, 155, 39, 176),
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  " Email: ",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    _email,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ]),
                        ))),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, right: 40),
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(70, 155, 39, 176),
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            " Event Name:  ",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: 69,
                          ),
                          Flexible(
                            child: Text(
                              _event,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 40.0, right: 40),
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(70, 155, 39, 176),
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            " Date: ",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: 76,
                          ),
                          Flexible(
                            child: Text(
                              _date,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),



                //buildrad(context),
                // const SizedBox(
                //   height: 40,
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 40.0, right: 40),
                //   child: Container(
                //       height: 45,
                //       decoration: BoxDecoration(
                //           color: Color.fromARGB(190, 155, 39, 176),
                //           borderRadius: BorderRadius.circular(30)),
                //       child: Padding(
                //         padding: const EdgeInsets.only(left: 10.0, right: 10),
                //         child: MaterialButton(
                //             padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                //             minWidth: MediaQuery.of(context).size.width,
                //             onPressed: () {
                //               //const MyApps();
                //               Navigator.push(
                //                 context,
                //                 MaterialPageRoute(
                //                     builder: (context) => MyApps(docId)),
                //               );
                //             },
                //             child: const Text(
                //               "Add prescript",
                //               textAlign: TextAlign.center,
                //               style: TextStyle(
                //                   fontSize: 20,
                //                   color: Colors.white,
                //                   fontWeight: FontWeight.bold),
                //             )),
                //       )),
                // ),
              ]),
        )));
  }
}
