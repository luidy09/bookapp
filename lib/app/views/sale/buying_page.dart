import 'package:bookapp/app/utils/constants.dart';
import 'package:bookapp/app/utils/functions/helper_functions.dart';
import 'package:bookapp/app/utils/functions/random_digits.dart';
import 'package:bookapp/app/views/sale/sale.dart';
import 'package:bookapp/app/views/sale/selling_book_info.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuyingPage extends StatefulWidget {
  final sellingId,
      title,
      timeago,
      author,
      genre,
      bookImage,
      price,
      username,
      address,
      email,
      phone1,
      phone2,
      userImage,
      delivery,
      isFromProfile;

  BuyingPage({
    this.isFromProfile = false,
    this.delivery = false,
    this.author,
    this.bookImage,
    this.genre,
    this.price,
    this.sellingId,
    this.timeago,
    this.title,
    this.userImage,
    this.address,
    this.email,
    this.phone1,
    this.phone2,
    this.username,
  });

  @override
  _BuyingPageState createState() => _BuyingPageState();
}

class _BuyingPageState extends State<BuyingPage> {
  TextEditingController codController = TextEditingController();

  double deliveryPrice;

  @override
  void initState() {
    super.initState();

    deliveryPrice = widget.delivery ? 1000.00 : 0.00;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("${widget.title}",
            style: GoogleFonts.montserrat(
                textStyle: TextStyle(
              color: Color(0xFF1A002D),
            ))),
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color(0XFF1A002D)),
            onPressed: () {
              Navigator.of(context).pop(context);
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
                              image: AssetImage("${widget.bookImage}"),
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
                      userImage: "${widget.userImage}",
                      username: "${widget.username}",
                      address: "${widget.address}",
                      genre: "${widget.genre}",
                      email: "${widget.email}",
                      phone1: "${widget.phone1}",
                      phone2: "${widget.phone2}",
                      author: "${widget.author}",
                      delivery: widget.delivery,
                      price: widget.price,
                      deliveryPrice: deliveryPrice,
                      timeago: "${widget.timeago}",
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
                      "${formatNumber(deliveryPrice + widget.price)}",
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
