import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class LibraryBookSellingcard extends StatelessWidget {
  final sellingId, title, timeago, author, genre, bookImage, price;

  LibraryBookSellingcard({
    this.author,
    this.bookImage,
    this.genre,
    this.price,
    this.sellingId,
    this.timeago,
    this.title,
  });

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
