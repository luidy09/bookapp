import 'package:bookapp/app/utils/constants.dart';
import 'package:flutter/material.dart';

class ExchangeCard extends StatelessWidget {
  final id,
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
      exchangeImage;
  const ExchangeCard(
      {this.id,
      this.title,
      this.exchangeImage,
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
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("$exchangeImage"), fit: BoxFit.cover),
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
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage("$userImage"),
                        ),
                        SizedBox(width: 15),
                        Container(
                            padding: EdgeInsets.only(right: 10, top: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("$username", style: userNameStyle),
                                Text("$address", style: addressInfoStyle),
                                Text("$email", style: addressInfoStyle),
                                Text("$phone1 / $phone2",
                                    style: addressInfoStyle),
                              ],
                            ))
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      print("Exchange ID is : $id");
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
                            child: Text("Interessado", style: buttonTextStyle)),
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
