import 'package:bookapp/app/utils/constants.dart';
import 'package:bookapp/app/views/login/login.dart';
import 'package:bookapp/app/views/registration/password.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterFirst extends StatefulWidget {
  @override
  _RegisterFirstState createState() => _RegisterFirstState();
}

class _RegisterFirstState extends State<RegisterFirst> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text("Faça o seu cadastro",
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                color: Color(0XFF1A002D),
              ))),
          elevation: 0.0,
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Color(0XFF1A002D)),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext contetx) => Login()));
              }),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                      child: TextField(
                    style: formLabelStyle,
                    decoration: InputDecoration(
                        labelText: "Nome",
                        contentPadding: EdgeInsets.only(top: 30)),
                  )),
                  Container(
                      child: TextField(
                    style: formLabelStyle,
                    decoration: InputDecoration(
                        labelText: "E-mail",
                        contentPadding: EdgeInsets.only(top: 30)),
                  )),
                  Container(
                      child: TextField(
                    style: formLabelStyle,
                    decoration: InputDecoration(
                        labelText: "Endereço",
                        contentPadding: EdgeInsets.only(top: 30)),
                  )),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text("Telefone", style: formLabelStyle),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                            width: 50.0,
                            child: TextField(
                              style: formLabelStyle,
                              enabled: false,
                              decoration: InputDecoration(
                                hintText: "+244",
                              ),
                            )),
                        SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                            child: Container(
                                child: TextField(
                          style: formLabelStyle,
                        ))),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Telefone (Alternativo)",
                    style: formLabelStyle,
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                            width: 50.0,
                            child: TextField(
                              style: formLabelStyle,
                              enabled: false,
                              decoration: InputDecoration(
                                hintText: "+244",
                              ),
                            )),
                        SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: Container(
                            child: TextField(
                              style: formLabelStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Center(
                      child: Container(
                        width: 160,
                        child: FlatButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Password()));
                            },
                            padding: EdgeInsets.all(12.0),
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(9.0)),
                            child: Text(
                              "Continuar",
                              //style: styleButton,
                            )),
                      ),
                    ),
                  )
                ],
              )),
            ),
          ),
        ));
  }
}
