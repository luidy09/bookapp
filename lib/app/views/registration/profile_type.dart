import 'package:bookapp/app/utils/constants.dart';
import 'package:bookapp/app/views/home/home_page.dart';
import 'package:bookapp/app/views/registration/confirm_password.dart';
import 'package:bookapp/app/views/registration/nif.dart';
import 'package:flutter/material.dart';

class ProfileType extends StatefulWidget {
  @override
  _ProfileTypeState createState() => _ProfileTypeState();
}

class _ProfileTypeState extends State<ProfileType> {
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
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext contetx) => ConfirmPassword(),
                ),
              );
            }),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      print("Type 0");

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext contetx) => HomePage(),
                        ),
                      );
                    },
                    child: cardUserType(
                      type: " Usuário normal",
                      typeIcon: Icons.person,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      print("Type 1");
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext contetx) => NIF(),
                        ),
                      );
                    },
                    child: cardUserType(
                      type: "Livraria",
                      typeIcon: Icons.import_contacts,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget cardUserType({type, typeIcon}) {
    return Container(
      height: 53,
      decoration: BoxDecoration(
          color: simpleGray,
          borderRadius: BorderRadius.all(
            Radius.circular(9),
          )),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            children: [
              Icon(
                typeIcon,
                color: mainColorDarkBlue,
              ),
              SizedBox(
                width: 30,
              ),
              Text("$type", style: userTypeTextStyle),
            ],
          ),
        ),
        constraints: BoxConstraints.expand(),
      ),
    );
  }
}
