import 'package:bookapp/app/utils/functions/helper_functions.dart';
import 'package:bookapp/app/views/sale/buying_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/constants.dart';

class LibraryBookSellingcard extends StatelessWidget {
  final sellingId,
      title,
      timeago,
      author,
      genre,
      bookImage,
      price,
      userImage,
      address,
      email,
      phone1,
      phone2,
      username;

  LibraryBookSellingcard(
      {this.author,
      this.bookImage,
      this.genre,
      this.price,
      this.sellingId,
      this.timeago,
      this.title,
      this.address,
      this.email,
      this.phone1,
      this.phone2,
      this.userImage,
      this.username});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: Container(
        height: 330,
        width: 300,
        constraints: BoxConstraints(
            maxWidth: 300, maxHeight: 330, minWidth: 300, minHeight: 330),
        decoration: BoxDecoration(
            color: librayContainerColor,
            borderRadius: BorderRadius.circular(9)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "$title",
                    style: bookToSellStyle,
                  ),
                  Text("$timeago", style: timeagoSmallStyle)
                ],
              ),
            ),
            Container(
              height: 180,
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: AssetImage("$bookImage"), fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "$author",
                    style: authorNameSmallStyle,
                  ),
                  Text("$genre", style: genreSmallRedStyle)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${formatNumber(price)}",
                    style: bookPriceStyle,
                  ),
                  Container(
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7)),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      color: mainColorGreen,
                      onPressed: () {
                        _showDialoReceptionType(context, title);
                      },
                      child: Text("Comprar", style: buttonBuyBookLibraryStyle),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _showDialoReceptionType(context, title) {
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
                    width: MediaQuery.of(context).size.width - 50,
                    height: 230,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Center(
                          child: SingleChildScrollView(
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "$title ",
                                        style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                                color: mainColorDarkBlue,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "Como deseja obter o livro ?",
                                        style: GoogleFonts.montserrat(
                                            textStyle: TextStyle()),
                                      ),
                                      SizedBox(height: 10),
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {
                                      print("Type 0");

                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (BuildContext contetx) =>
                                              BuyingPage(
                                            delivery: true,
                                            author: author,
                                            bookImage: bookImage,
                                            genre: genre,
                                            price: price,
                                            sellingId: sellingId,
                                            timeago: timeago,
                                            title: title,
                                            userImage: userImage,
                                            address: address,
                                            email: email,
                                            phone1: phone1,
                                            phone2: phone2,
                                            username: username,
                                          ),
                                        ),
                                      );
                                    },
                                    child: cardReceptionType(
                                      type: " Com entrega",
                                      typeIcon: Icons.motorcycle,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      print("Type 1");
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (BuildContext contetx) =>
                                              BuyingPage(
                                            author: author,
                                            bookImage: bookImage,
                                            genre: genre,
                                            price: price,
                                            sellingId: sellingId,
                                            timeago: timeago,
                                            title: title,
                                            userImage: userImage,
                                            address: address,
                                            email: email,
                                            phone1: phone1,
                                            phone2: phone2,
                                            username: username,
                                          ),
                                        ),
                                      );
                                    },
                                    child: cardReceptionType(
                                      type: "Sem entrega",
                                      typeIcon: Icons.directions_walk,
                                    ),
                                  ),
                                ],
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

  Widget cardReceptionType({type, typeIcon}) {
    return Container(
      height: 53,
      decoration: BoxDecoration(
          color: simpleGray,
          borderRadius: BorderRadius.all(
            Radius.circular(9),
          )),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            children: [
              Icon(
                typeIcon,
                color: mainColorDarkBlue,
              ),
              SizedBox(
                width: 30,
              ),
              Text("$type", style: userTypeTextStyle),
            ],
          ),
        ),
        constraints: BoxConstraints.expand(),
      ),
    );
  }
}
