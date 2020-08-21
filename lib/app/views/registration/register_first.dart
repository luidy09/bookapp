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
  final _formKey = GlobalKey<FormState>();
  TextEditingController nomeController;
  TextEditingController emailController;
  TextEditingController enderecoController;
  TextEditingController phoneController;
  TextEditingController altphoneController;

  validade() {
    if (_formKey.currentState.validate()) {}
  }

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
                  child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                        child: TextFormField(
                      controller: nomeController,
                      validator: (val) =>
                          val == '' ? 'Digite o seu nome' : null,
                      keyboardType: TextInputType.name,
                      style: formLabelStyle,
                      decoration: InputDecoration(
                          labelText: "Nome",
                          contentPadding: EdgeInsets.only(top: 30)),
                    )),
                    Container(
                        child: TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: formLabelStyle,
                      decoration: InputDecoration(
                          labelText: "E-mail",
                          contentPadding: EdgeInsets.only(top: 30)),
                    )),
                    Container(
                        child: TextFormField(
                      controller: enderecoController,
                      validator: (val) =>
                          val == '' ? 'Digite um endereço valido' : null,
                      keyboardType: TextInputType.streetAddress,
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
                                keyboardType: TextInputType.number,
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
                                  child: TextFormField(
                            controller: phoneController,
                            validator: (val) => val == '' || val.length < 9
                                ? 'Digite um telefone valido'
                                : null,
                            keyboardType: TextInputType.number,
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
                                keyboardType: TextInputType.number,
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
                              child: TextFormField(
                                controller: altphoneController,
                                validator: (val) => val == '' || val.length < 9
                                    ? 'Digite um telefone valido'
                                    : null,
                                keyboardType: TextInputType.number,
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
                ),
              )),
            ),
          ),
        ));
  }
}
