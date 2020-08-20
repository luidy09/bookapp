import 'package:bookapp/app/utils/constants.dart';
import 'package:bookapp/app/views/home/home_page.dart';
import 'package:bookapp/app/views/registration/profile_type.dart';
import 'package:flutter/material.dart';

class NIF extends StatefulWidget {
  @override
  _NIFState createState() => _NIFState();
}

class _NIFState extends State<NIF> {
  TextEditingController nifController = TextEditingController();

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
                  builder: (BuildContext contetx) => ProfileType(),
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
                  Text(
                    "Digite o  Número de Identificação Fiscal (NIF)",
                    style: nifTextStyle,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    textAlign: TextAlign.center,
                    controller: nifController,
                    validator: (val) => val.length == 0 ? 'Digite o NIF' : null,
                    // onSaved: (val) => author = val,
                    // style: TextStyle(color: iconColor),
                    decoration: InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        borderSide: BorderSide.none,
                        //borderSide: const BorderSide(),
                      ),
                      filled: true,
                      fillColor: simpleGray,
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
                                      HomePage()));
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
            ),
          ),
        ),
      ),
    );
  }
}
