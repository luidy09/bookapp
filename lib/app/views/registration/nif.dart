import 'package:bookapp/app/models/library_model.dart';
import 'package:bookapp/app/models/user_model.dart';
import 'package:bookapp/app/services/network_requests/library_service.dart';
import 'package:bookapp/app/services/shared_local_storage_service.dart';
import 'package:bookapp/app/utils/constants.dart';
import 'package:bookapp/app/utils/functions/dialogues.dart';
import 'package:bookapp/app/views/registration/profile_type.dart';
import 'package:bookapp/app/views/registration/welcome_page.dart';
import 'package:flutter/material.dart';

class NIF extends StatefulWidget {
  final Map<String, String> data;

  NIF({this.data});
  @override
  _NIFState createState() => _NIFState();
}

class _NIFState extends State<NIF> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nifController = new TextEditingController();
  SharedLocalStorageServices sharedPrefs = new SharedLocalStorageServices();
  String get nif => nifController.text;
  UserModel user;
  @override
  void initState() {
    super.initState();
    print("DATA IN NIF");
    print(widget.data);
  }

  registUser() async {
    registerProcessingDialog(context);
    LibraryModel library = LibraryModel.fromJson(widget.data);

    addLibrary(library.toJson()).then((response) async {
      Navigator.pop(context);

      if (response.code != "201") {
        registerErrorDialogue(
            context: context,
            message: "Ocorreu um erro ao efectuar o cadastro");
      } else {
        user = UserModel.onRegistrationJson(response.data);
        sharedPrefs.put("token", user.token);
        sharedPrefs.put("userType", (user.userType == UserType.Reader) ? 1 : 2);
        sharedPrefs.put("userID", user.idUsuario);

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) => WelcomePage(
                      userType: user.userType,
                      userId: user.idUsuario,
                    )),
            (Route<dynamic> route) => false);
      }
    });
  }

  validate() {
    if (_formKey.currentState.validate()) {
      try {
        widget.data.update("nif", (existingValue) => nif, ifAbsent: () => nif);
        print(widget.data);
        registUser();
      } catch (error) {
        print("User data was lost ");
      }
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
}
