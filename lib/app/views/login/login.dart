import 'package:bookapp/app/components/AppLogo.dart';
import 'package:bookapp/app/models/user_model.dart';
import 'package:bookapp/app/services/network_requests/user_service.dart';
import 'package:bookapp/app/services/shared_local_storage_service.dart';
import 'package:bookapp/app/utils/constants.dart';
import 'package:bookapp/app/utils/functions/dialogues.dart';
import 'package:bookapp/app/views/home/home_page.dart';
import 'package:bookapp/app/views/library_user/library_profile_owner.dart';
import 'package:bookapp/app/views/registration/register_first.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController phoneController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  SharedLocalStorageServices sharedPrefs = new SharedLocalStorageServices();
  UserModel user;

  String get phone => phoneController.text;
  String get password => passwordController.text;

  validadeLogin() {
    if (_formKey.currentState.validate()) {
      registerProcessingDialog(context);

      user = UserModel(telefone1: phone, senha: password);

      login(user.toJson()).then((response) {
        Navigator.pop(context);

        if (response.code == "000") {
          registerErrorDialogue(
              context: context, message: "Erro ao efectuar login");
        } else if (response.code == "202") {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => LibraryProfileOwner()));
        } else {
          registerErrorDialogue(context: context, message: "Login incorrecto");
        }
        //user = UserModel.onLogin(response.data["user"]);
      });
    }
  }

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
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
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
                        Text("PIN de acesso", style: formLabelStyle),
                        Container(
                            child: TextFormField(
                          controller: passwordController,
                          validator: (val) => (val == '')
                              ? 'Digite o seu PIN de acesso'
                              : (val.length < 4)
                                  ? 'Digite correctamente o seu PIN'
                                  : null,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            WhitelistingTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(4)
                          ],
                          style: formLabelStyle,
                        )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  InkWell(
                    onTap: () {
                      validadeLogin();

                      /*Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (BuildContext context) => HomePage()),
                          (Route<dynamic> route) => false); */
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
