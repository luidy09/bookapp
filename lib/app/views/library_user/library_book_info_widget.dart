import 'package:bookapp/app/utils/constants.dart';
import 'package:flutter/material.dart';

class LibraryBookInfoWidget extends StatelessWidget {
  final title, author, genre, publishing, bookImage;

  LibraryBookInfoWidget(
      {this.title, this.author, this.genre, this.publishing, this.bookImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15, left: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: 60,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("$bookImage"),
            )),
          ),
          SizedBox(width: 20),
          Container(
              padding: EdgeInsets.only(right: 10, top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("$title", style: librayUserNameStyle),
                  SizedBox(
                    height: 5,
                  ),
                  Text("$author", style: librayaContactStyle),
                  SizedBox(
                    height: 5,
                  ),
                  Text("$genre", style: librayaContactStyle),
                  SizedBox(
                    height: 5,
                  ),
                  Text("$publishing ", style: librayaContactStyle),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.people,
                        color: mainColorGreen,
                        size: 10,
                      ),
                      SizedBox(width: 10),
                      Text("100 seguidores", style: librayaFollowersStyle),
                    ],
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
