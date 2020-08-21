import 'package:bookapp/app/utils/constants.dart';
import 'package:bookapp/app/utils/functions/random_digits.dart';
import 'package:bookapp/app/views/exchange/proposaer_book_info.dart';
import 'package:bookapp/app/views/home/home_page.dart';
import 'package:bookapp/app/views/sale/sale.dart';
import 'package:bookapp/app/views/sale/selling_book_info.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuyingPage extends StatefulWidget {
  @override
  _BuyingPageState createState() => _BuyingPageState();
}

class _BuyingPageState extends State<BuyingPage> {
  TextEditingController codController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("A Arte de Seguir Alguém ",
            style: GoogleFonts.montserrat(
                textStyle: TextStyle(
              color: Color(0xFF1A002D),
            ))),
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color(0XFF1A002D)),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext contetx) => Sale()));
            }),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            Container(
              child: Stack(
                alignment: Alignment.topLeft,
                children: <Widget>[
                  Container(
                    child: Column(
                      children: [
                        Container(
                          height: 230,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/landbook4.jpeg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          height: 110,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 130,
                    left: 10,
                    right: 10,
                    child: SellingBookInfo(
                      userImage:
                          "assets/images/users/photo-1463453091185-61582044d556.jpeg",
                      username: "Livraria Lelo",
                      address: "Luanda, Rua Amilcar Cabral , N 123",
                      genre: "Motivacional",
                      email: "lelo@gmail.com",
                      phone1: "222 333 345",
                      phone2: "923 454 567",
                      author: "Dárdano Santos",
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 10, bottom: 10),
              child: Container(
                padding: EdgeInsets.all(10),
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  ),
                  /* boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 6,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],*/
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        child: Text(
                      "3500.00 AOA",
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: mainColorGreen)),
                    )),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Digite o código de pagamento",
                        style: GoogleFonts.montserrat(textStyle: TextStyle())),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      textAlign: TextAlign.center,
                      controller: codController,
                      validator: (val) => val.length == 0
                          ? 'Digite o código de pagamento'
                          : null,
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
                                _showDialogSellStatus(context);
                              },
                              padding: EdgeInsets.all(12.0),
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(9.0)),
                              child: Text(
                                "Finalizar Compra",
                                //style: styleButton,
                              )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<bool> _showDialogSellStatus(context) {
    return showGeneralDialog(
        context: context,
        barrierDismissible: false,
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
                    width: MediaQuery.of(context).size.width - 50,
                    height: 270,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topRight,
                            child: IconButton(
                                icon: Icon(Icons.close),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Center(
                              child: SingleChildScrollView(
                                child: Container(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.check_circle_outline,
                                        color: mainColorGreen,
                                        size: 70,
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      Container(
                                        child: Text(
                                            "Sua compra foi efectuada com sucesso!",
                                            style: GoogleFonts.montserrat(
                                                textStyle: TextStyle())),
                                      ),
                                      Container(
                                        child: Text(
                                          "Seu código para recepção é:",
                                          style: GoogleFonts.montserrat(
                                              textStyle: TextStyle()),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      Container(
                                        child: Text(
                                            "${RandomDigits.getInteger(8)}",
                                            style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                    color: mainColorDarkBlue,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20))),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          );
        });
  }
}
