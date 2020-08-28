import 'package:bookapp/app/models/library_model.dart';
import 'package:bookapp/app/models/user_model.dart';
import 'package:bookapp/app/network_requests/library_service.dart';
import 'package:bookapp/app/views/registration/confirm_password.dart';

import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  Map<String, String> data;

  WelcomePage({this.data});

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("DATA IN WELCOME PAGE");
    print(widget.data);

    registUser();
  }

  registUser() {
    print("Init Registration");

    LibraryModel library = LibraryModel.fromJson(widget.data);
    var response = addLibrary(library.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color(0XFF1A002D)),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [Text("Seja Bem Vindo ao BookApp")],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
