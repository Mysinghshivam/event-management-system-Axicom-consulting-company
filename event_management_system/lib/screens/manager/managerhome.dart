// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/material.dart';

// class ManagerHome extends StatelessWidget {
//   const ManagerHome({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: const Text("Home"),
//         // centerTitle: true,
//         // leading: IconButton(
//         //   icon: Icon(Icons.arrow_back, color: Colors.black),
//         //   onPressed: () {
//         //     // passing this to our root
//         //     Navigator.of(context).pop();
//         //   },
//         // ),
//       ),
//       body: SingleChildScrollView(
//           child: Container(
//         color: Colors.white,
//         child: Padding(
//             padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0),
//             child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   const Center(
//                     child: TextField(
//                       decoration: InputDecoration(
//                           hintText: 'Search Event by ID',
//                           prefixIcon: Icon(Icons.search),
//                           suffix: Text("Go")),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 100,
//                   ),
//                   SizedBox(
//                       height: 200,
//                       child: Image.asset(
//                         "assets/logo1.jpeg",
//                         fit: BoxFit.contain,
//                       )),
//                 ])),
//       )),
//     );
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_management_system/screens/manager/eventdetails.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ManagerHome extends StatefulWidget {
  ManagerHome({Key? key}) : super(key: key);

  @override
  _ManagerHomeState createState() => _ManagerHomeState();
}

class _ManagerHomeState extends State<ManagerHome> {
  _ManagerHomeState();
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('events')
      .orderBy("timeStamp", descending: true)
      .snapshots();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  User? manager = FirebaseAuth.instance.currentUser;

  // var _eid = "";
  var _name = "";

  @override
  void initState() {
    // debugPrint(manager!.uid);
    super.initState();
    firebaseFirestore
        .collection("manager")
        .doc(manager!.uid)
        .get()
        .then((value) {
      setState(() {
        _name = value.data()!["firstName"] + " " + value.data()!["secondName"];
        // _qualification = value.data()!["qualification"];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Column(
                        children: [
                          Text(
                            "Hello!",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Mr. $_name",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 70.0),
                          //   child: Text(
                          //     _qualification,
                          //   ),
                          // )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(80),
                        child: Image.asset(
                          'assets/logo.png',
                          height: 100,
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: 50,
            ),
            eventList(),
          ],
        )));
  }

  eventList() {
    return StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.docs.length != 0) {
              return Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: ListView.separated(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var reserveIndex = snapshot.data!.docs.length - index - 1;
                    var ds = snapshot.data!.docs[reserveIndex];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  EventDetails(ds["eid"])),
                        );
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          // backgroundImage: NetworkImage("https://www.google.com/imgres?imgurl=https%3A%2F%2Fthumbs.dreamstime.com%2Fb%2Fsmiling-female-doctor-holding-medical-records-lab-coat-her-office-clipboard-looking-camera-56673035.jpg&imgrefurl=https%3A%2F%2Fwww.dreamstime.com%2Fphotos-images%2Fdoctor.html&tbnid=EycEseRDhNp2DM&vet=12ahUKEwiv4NfF28b5AhXfktgFHRfnAzcQMygAegUIARC6AQ..i&docid=cREmzhIXVvISOM&w=800&h=488&q=doctor%20image%20download&client=ubuntu&ved=2ahUKEwiv4NfF28b5AhXfktgFHRfnAzcQMygAegUIARC6AQ"),
                          backgroundColor: Colors.purpleAccent,
                        ),
                        title: Text(
                          ds["id"],
                          style: TextStyle(
                            // fontFamily:'RobotoMono',
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        subtitle: Text(
                          ds["name"],
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                ),
              ));
            } else {
              return const Center(
                child: Text("No Events",
                    style: TextStyle(
                      fontSize: 20,
                    )),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.purple,
              ),
            );
          }
        });
  }
}
