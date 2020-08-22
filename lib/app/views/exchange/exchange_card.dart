import 'package:bookapp/app/components/show_book_image_dialog.dart';
import 'package:bookapp/app/components/user_info_widget.dart';
import 'package:bookapp/app/utils/constants.dart';
import 'package:bookapp/app/views/exchange/exchange_detail.dart';
import 'package:flutter/material.dart';

class ExchangeCard extends StatelessWidget {
  final idExchange,
      title,
      author,
      genre,
      timeago,
      userImage,
      username,
      address,
      email,
      phone1,
      phone2,
      bookImage,
      isMine;
  const ExchangeCard(
      {this.isMine = false,
      this.idExchange,
      this.title,
      this.bookImage,
      this.author,
      this.genre,
      this.timeago,
      this.username,
      this.address,
      this.email,
      this.phone1,
      this.phone2,
      this.userImage});

  @override
  Widget build(BuildContext context) {
    String btnText = isMine ? "Ver propostas" : "Interessado";
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        //color: Colors.teal,
        border: Border.all(color: containerBorderColor, width: 0.5),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("$title", style: bookTitleStyle),
                  Text("$timeago", style: timeagoStyle)
                ],
              )),
          InkWell(
            onTap: () {
              ShowBookImageDialog.show(context, bookImage, title);
            },
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("$bookImage"), fit: BoxFit.cover),
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("$author", style: authorNameStyle),
                  Text("$genre", style: genreStyle)
                ],
              )),
          Container(
              padding: EdgeInsets.only(left: 10, right: 10, top: 5),
              child: Column(
                children: [
                  UserInfoWidget(
                    userImage: userImage,
                    address: address,
                    email: email,
                    phone1: phone1,
                    phone2: phone2,
                    username: username,
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      print("Exchange ID is : $idExchange");

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => ExchangeDetail(
                            timeago: timeago,
                            isMine: isMine,
                            userImage: userImage,
                            username: username,
                            address: address,
                            phone1: phone1,
                            phone2: phone2,
                            email: email,
                            title: title,
                            genre: genre,
                            author: author,
                            bookImage: bookImage,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 43,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: buttonBorderColor, width: 0.5),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          )),
                      child: Container(
                        child: Center(
                            child: Text("$btnText ", style: buttonTextStyle)),
                        constraints: BoxConstraints.expand(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              )),
        ],
      ),
    );
  }
}
