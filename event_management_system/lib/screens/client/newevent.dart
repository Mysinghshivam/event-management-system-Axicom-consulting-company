import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dob_input_field/dob_input_field.dart';
import 'package:event_management_system/screens/client/clienthome.dart';
import 'package:event_management_system/screens/client/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ClientNewEvent extends StatelessWidget {
  ClientNewEvent({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser;

  // string for displaying the error Message
  String? errorMessage;

  // our form key
  final _formKey = GlobalKey<FormState>();
  // editing Controller
  final nameEditingController = new TextEditingController();
  final phoneEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final eventtypeEditingController = new TextEditingController();
  final dateEditingController = new TextEditingController();
  final budgetEditingController = new TextEditingController();
  final addressEditingController = new TextEditingController();
  final otherEditingController = new TextEditingController();
  String eid = "EV${DateTime.now().millisecondsSinceEpoch}";
  @override
  Widget build(BuildContext context) {
    //Name
    final nameField = TextFormField(
        autofocus: false,
        controller: nameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          // RegExp regex = new RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("Name cannot be Empty");
          }
          return null;
        },
        onSaved: (value) {
          nameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.note),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //Phone
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(patttern);
    final phoneField = TextFormField(
        autofocus: false,
        controller: phoneEditingController,
        keyboardType: TextInputType.phone,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Phone");
          }
          // reg expression for email validation
          else if (!RegExp("^(?:[+0]9)?[0-9]{10,12})").hasMatch(value)) {
            return ("Please Enter a valid phone");
          }
          return null;
        },
        onSaved: (value) {
          phoneEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.phone),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Phone Number(with +91)",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));
    //email field
    final emailField = TextFormField(
        autofocus: false,
        controller: emailEditingController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          emailEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //event
    final eventtypeField = TextFormField(
        autofocus: false,
        controller: eventtypeEditingController,
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          } else {
            return null;
          }
        },
        onSaved: (value) {
          eventtypeEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.event),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Event Type(e.g Birthday, Marriage etc)",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //date

    final dateField = DOBInputField(
        autofocus: false,
        firstDate: DateTime.now(),
        lastDate: DateTime(2100),
        showLabel: true,
        // autovalidateMode: AutovalidateMode.always,
        // fieldLabelText: "Date of Event",
        onDateSubmitted: (value) {
          debugPrint("hello world" + value.toString());
          dateEditingController.text = value.toString();
        },
        inputDecoration: InputDecoration(
          hintText: "MM/DD/YYYY",
          prefixIcon: Icon(Icons.event),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //budget
    final budgetField = TextFormField(
        autofocus: false,
        controller: budgetEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = new RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%\s-]');
          if (value!.isEmpty) {
            return ("Budget cannot be Empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid amount");
          }
          return null;
        },
        onSaved: (value) {
          budgetEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.currency_rupee),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Budget",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

//address
    final addressField = TextFormField(
      autofocus: false,
      controller: addressEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^[#.0-9a-zA-Z\s,-]+$');
        if (value!.isEmpty) {
          return ("Address cannot be Empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Adress");
        }
        return null;
      },
      onSaved: (value) {
        addressEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.home),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "\nAddress",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      maxLines: 3,
    );

//other
    final otherField = TextFormField(
      autofocus: false,
      controller: otherEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^[#.0-9a-zA-Z\s,-]+$');
        if (value!.isEmpty) {
          return ("Address cannot be Empty");
        }
        return null;
      },
      onSaved: (value) {
        otherEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.notes),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "\nExtra details",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      maxLines: 3,
    );

    final submit = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blueAccent,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () async {
            await FirebaseFirestore.instance
                .collection("events")
                .doc(user!.uid)
                .set({
              'id': eid,
              'name': nameEditingController.text,
              'phone': phoneEditingController.text,
              'email': emailEditingController.text,
              'eventName': eventtypeEditingController.text,
              'date': dateEditingController.text,
              'budget': budgetEditingController.text,
              'address': addressEditingController.text,
              'others': otherEditingController.text,
              'eid': user!.uid,
              'timeStamp': DateTime.now(),
            });
            Fluttertoast.showToast(msg: "Event created successfully :) ");

            Navigator.pushReplacement(
                (context),
                MaterialPageRoute(builder: (context) => const ClientHomeScreen()),
                );
          },
          // ignore: prefer_const_constructors
          child: Text(
            "Submit",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 180,
                        child: Image.asset(
                          "assets/reg.png",
                          fit: BoxFit.contain,
                        )),
                    SizedBox(height: 45),
                    nameField,
                    SizedBox(height: 20),
                    phoneField,
                    SizedBox(height: 20),
                    emailField,
                    SizedBox(height: 20),
                    eventtypeField,
                    SizedBox(height: 20),
                    budgetField,
                    SizedBox(height: 20),
                    dateField,
                    SizedBox(height: 20),
                    addressField,
                    SizedBox(height: 15),
                    otherField,
                    SizedBox(height: 15),
                    submit,
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
