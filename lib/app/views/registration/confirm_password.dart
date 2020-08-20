import 'package:bookapp/app/views/registration/password.dart';
import 'package:bookapp/app/views/registration/profile_type.dart';
import 'package:flutter/material.dart';

import 'package:bookapp/app/utils/constants.dart';

class ConfirmPassword extends StatefulWidget {
  final password;
  ConfirmPassword({this.password});

  @override
  _ConfirmPasswordState createState() => _ConfirmPasswordState();
}

class _ConfirmPasswordState extends State<ConfirmPassword> {
  TextEditingController passwordController = TextEditingController();

  List<Widget> dots = [];
  String password = "";
  bool hasError = false;

  addNumber(number) {
    if (password.trim().length != 4) {
      password = password + number;
      addDot();
      if (password.length == 4) {
        if (widget.password != password) {
          setState(() {
            hasError = true;
          });
          print("Password diferente");
        } else {
          print("Password Matched");
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => ProfileType(),
            ),
          );
        }
      }
      print(password);
    } else {
      print("Finished Insertion $password");
    }
  }

  removeNumber() {
    if (password.trim().isNotEmpty) {
      password = password.substring(0, password.length - 1);
      removeDot();

      if (password.isEmpty) {
        setState(() {
          hasError = false;
        });
      }
      print(password);
    }
  }

  addDot() {
    setState(() {
      Widget value = Container(
        height: 15,
        width: 15,
        margin: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
            color: addressInfoColor, borderRadius: BorderRadius.circular(100)),
      );
      dots.add(value);
    });
  }

  removeDot() {
    setState(() {
      dots.removeLast();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Escolha uma senha"),
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0.0,
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Color(0XFF1A002D)),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext contetx) => Password()));
              }),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                  child: Column(
                children: <Widget>[
                  Text("Confirme a sua senha",
                      style: passwordDescriptionTitleStyle),
                  SizedBox(height: 20),
                  Container(
                    height: 53,
                    decoration: BoxDecoration(
                        color: simpleGray,
                        borderRadius: BorderRadius.circular(6)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: dots,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  hasError
                      ? Text(
                          "Senha diferente da anterior...",
                          style: passwordMatchErrorStyle,
                        )
                      : Text(""),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 298,
                    decoration: BoxDecoration(
                      color: passwordContainerColor,
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        lineNumbers(num1: "1", num2: "2", num3: "3"),
                        lineNumbers(num1: "4", num2: "5", num3: "6"),
                        lineNumbers(num1: "7", num2: "8", num3: "9"),
                        lineNumbers(
                            isLastLine: true, num1: "0", num2: "0", num3: "⟵"),
                      ],
                    ),
                  )
                ],
              )),
            ),
          ),
        ));
  }

  Widget lineNumbers({isLastLine = false, num1, num2, num3}) {
    return Container(
      //color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          roundedContainerNumber(
              isLastLine: isLastLine, isBlackSheep: true, number: num1),
          roundedContainerNumber(isLastLine: isLastLine, number: num2),
          roundedContainerNumber(
              isLastLine: isLastLine, isDeleting: true, number: num3),
        ],
      ),
    );
  }

  Widget roundedContainerNumber({
    isBlackSheep = false,
    isLastLine = false,
    isDeleting: false,
    number,
  }) {
    return Opacity(
      opacity: (isBlackSheep && isLastLine) ? 0.0 : 1.0,
      child: Container(
        child: FlatButton(
          padding: EdgeInsets.all(15.0),
          shape: CircleBorder(),
          //color: Colors.amber,
          onPressed: () {
            //Verifica se  nao e o elemento que nao quero mostrar
            if (!(isBlackSheep && isLastLine)) {
              //Verifica se nao e o botao de apagar
              if (!(isLastLine && isDeleting)) {
                addNumber(number);
              } else {
                removeNumber();
              }
            }
          },
          child: Text(
            "$number",
            style: customKeyBoardNumberStyle,
          ),
        ),
      ),
    );
  }
}
