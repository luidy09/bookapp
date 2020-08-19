import 'package:bookapp/app/components/AppLogo.dart';
import 'package:bookapp/app/utils/constants.dart';
import 'package:bookapp/app/views/home/home_page.dart';
import 'package:bookapp/app/views/registration/register_first.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AppLogo(),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text("Telefone", style: formLabelStyle),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                            //PUT DISABLED BORDER COLOR
                            width: 50.0,
                            child: TextField(
                              style: formLabelStyle,
                              enabled: false,
                              decoration: InputDecoration(
                                  hintText: "+244",
                                  disabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: buttonBorderColor),
                                  )),
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
                  Container(
                      child: TextField(
                    style: formLabelStyle,
                    decoration: InputDecoration(
                        labelText: "Senha",
                        contentPadding: EdgeInsets.only(top: 50)),
                  )),
                  SizedBox(
                    height: 40.0,
                  ),
                  InkWell(
                    onTap: () {
                      print("login");

                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (BuildContext context) => HomePage()),
                          (Route<dynamic> route) => false);
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: buttonBorderColor, width: 0.5),
                          borderRadius: BorderRadius.all(
                            Radius.circular(9),
                          )),
                      child: Container(
                        child: Center(
                            child:
                                Text("Iniciar Sessão", style: buttonTextStyle)),
                        constraints: BoxConstraints.expand(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Center(
                      child: InkWell(
                    onTap: () {
                      print("forgot password");
                    },
                    child:
                        Text("Esqueceu a sua senha?", style: buttonTextStyle),
                  )),
                  SizedBox(
                    height: 40.0,
                  ),
                  InkWell(
                    onTap: () {
                      print("register");
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => RegisterFirst(),
                        ),
                      );
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(color: mainColorGreen, width: 0.5),
                          borderRadius: BorderRadius.all(
                            Radius.circular(9),
                          )),
                      child: Container(
                        child: Center(
                            child: Text("Novo registo",
                                style: formButtonGreenlStyle)),
                        constraints: BoxConstraints.expand(),
                      ),
                    ),
                  ),
                ],
              )),
            ),
          ),
        ));
  }
}
