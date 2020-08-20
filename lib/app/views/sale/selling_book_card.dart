import 'package:bookapp/app/components/selling_book_user_info_widget.dart';
import 'package:bookapp/app/components/user_info_widget.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class SellingBookCard extends StatelessWidget {
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
      userImage;

  SellingBookCard({
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
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: Container(
        height: 405,
        constraints: BoxConstraints(
            maxWidth: 300, maxHeight: 405, minWidth: 300, minHeight: 405),
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
            SellingBookUserInfoWidget(
              userImage: "$userImage",
              address: "$address",
              email: "$email",
              phone1: "$phone1",
              phone2: "$phone2",
              username: "$username",
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
                    "$price",
                    style: bookPriceStyle,
                  ),
                  Container(
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7)),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      color: mainColorGreen,
                      onPressed: () {},
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
}
