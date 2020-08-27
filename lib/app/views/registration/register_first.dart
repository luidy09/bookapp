import 'package:bookapp/app/utils/constants.dart';
import 'package:bookapp/app/utils/functions/helper_functions.dart';
import 'package:bookapp/app/views/login/login.dart';
import 'package:bookapp/app/views/registration/password.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterFirst extends StatefulWidget {
  Map<String, String> data;
  final bool fill;
  RegisterFirst({this.data, this.fill = false});

  @override
  _RegisterFirstState createState() => _RegisterFirstState();
}

class _RegisterFirstState extends State<RegisterFirst> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nomeController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController enderecoController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController altphoneController = new TextEditingController();

  String get name => nomeController.text;
  String get email => emailController.text;
  String get address => enderecoController.text;
  String get phone => phoneController.text;
  String get altPhone => altphoneController.text;

  @override
  void initState() {
    super.initState();
    fillInputs();
  }

  fillInputs() {
    if (widget.fill) {
      nomeController.text = widget.data['name'] ?? "";
      emailController.text = widget.data['email'] ?? "";
      enderecoController.text = widget.data['address'] ?? "";
      phoneController.text = widget.data['phone'] ?? "";
      altphoneController.text = widget.data['altphone'] ?? "";
    }
  }

  validade() {
    print("NAME IS : ${nomeController.text}");

    if (_formKey.currentState.validate()) {
      widget.data = {
        "name": name,
        "email": email,
        "address": address,
        "phone": phone,
        "altphone": altPhone
      };

      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => Password(
                data: widget.data,
              )));
      /* print(
          "NAME: $name , Email: $email , Address : $address , PHONE : $phone , ALTPHONE : $altPhone ");

          */
    }
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
                      validator: (val) => (val != '' && !isEmail(val))
                          ? 'Digite um endereço de e-mail válido'
                          : null,
                      style: formLabelStyle,
                      decoration: InputDecoration(
                          labelText: "E-mail (Opcional)",
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
                        child: TextFormField(
                      controller: phoneController,
                      validator: (val) => val == '' || val.length < 9
                          ? 'Digite um telefone valido'
                          : null,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        WhitelistingTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(9)
                      ],
                      style: formLabelStyle,
                      decoration: InputDecoration(
                          prefix: Text(
                        "+244 ",
                        style: TextStyle(fontSize: 14),
                      )),
                    )),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Telefone (Alternativo)",
                      style: formLabelStyle,
                    ),
                    Container(
                      child: TextFormField(
                        controller: altphoneController,
                        validator: (val) => val == '' || val.length < 9
                            ? 'Digite um telefone valido'
                            : null,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          WhitelistingTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(9)
                        ],
                        style: formLabelStyle,
                        decoration: InputDecoration(
                            prefix: Text(
                          "+244 ",
                          style: TextStyle(fontSize: 14),
                        )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Center(
                        child: Container(
                          width: 160,
                          child: FlatButton(
                              onPressed: () {
                                validade();
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
