import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ClientHome extends StatelessWidget {
  const ClientHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Home"),
        // centerTitle: true,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back, color: Colors.black),
        //   onPressed: () {
        //     // passing this to our root
        //     Navigator.of(context).pop();
        //   },
        // ),
      ),
      body: SingleChildScrollView(
          child: Container(
        color: Colors.white,
        child: Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Center(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Search Event by ID',
                          prefixIcon: Icon(Icons.search),
                          suffix: Text("Go")),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  SizedBox(
                      height: 200,
                      child: Image.asset(
                        "assets/logo1.jpeg",
                        fit: BoxFit.contain,
                      )),
                ])),
      )),
    );
  }
}
