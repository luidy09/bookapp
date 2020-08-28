import 'package:bookapp/app/utils/constants.dart';
import 'package:bookapp/app/views/registration/profile_type.dart';
import 'package:bookapp/app/views/registration/welcome_page.dart';
import 'package:flutter/material.dart';

class NIF extends StatefulWidget {
  Map<String, String> data;

  NIF({this.data});
  @override
  _NIFState createState() => _NIFState();
}

class _NIFState extends State<NIF> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nifController = new TextEditingController();

  String get nif => nifController.text;
  @override
  void initState() {
    super.initState();
    print("DATA IN NIF");
    print(widget.data);
  }

  validate() {
    if (_formKey.currentState.validate()) {
      // widget.data.update("nif", (existingValue) => nif, ifAbsent: () => nif);

      //registerProcessingDialog(context);

      registerErrorDialogue(
          context: context, message: "Ocorreu um erro ao efectuar o cadastro");

      /*
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => WelcomePage(
                data: widget.data,
              )));

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
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color(0XFF1A002D)),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext contetx) => ProfileType(
                    data: widget.data,
                  ),
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
                  Form(
                    key: _formKey,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      controller: nifController,
                      validator: (val) =>
                          val.length == 0 ? 'Digite o NIF' : null,
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
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Center(
                      child: Container(
                        width: 160,
                        child: FlatButton(
                            onPressed: () {
                              validate();
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

  Future<bool> registerErrorDialogue({
    hasError = false,
    isProcessing = false,
    message,
    @required context,
  }) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            child: Container(
              color: Colors.transparent,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListBody(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topRight,
                        child: IconButton(
                            icon: Icon(
                              Icons.close,
                              size: 25,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                              child: Icon(
                            Icons.error,
                            size: 60,
                            color: Colors.red,
                          )),
                          Container(
                            child: Text(
                              "$message",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: (!hasError)
                                      ? Colors.black87
                                      : Colors.red),
                            ),
                          ),
                          SizedBox(height: 30)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  static Future<bool> registerProcessingDialog(context) {
    return showGeneralDialog(
        context: context,
        barrierDismissible: true,
        pageBuilder: (context, animation1, animation2) {
          return;
        },
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        transitionBuilder: (context, a1, a2, widget) {
          final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
          return Transform(
            transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
            child: Center(
              child: Opacity(
                opacity: a1.value,
                child: Container(
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      //color: simpleBackgroundContainerColor,
                    ),
                    child: Material(
                      borderRadius: BorderRadius.circular(8),
                      color: simpleBackgroundContainerColor,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                        child: Center(
                          child: SingleChildScrollView(
                            child: Container(
                              padding: EdgeInsets.all(5.0),
                              width: 60,
                              height: 60,
                              child: CircularProgressIndicator(
                                backgroundColor: mainColorGreen,
                                strokeWidth: 6,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )),
              ),
            ),
          );
        });
  }
}
