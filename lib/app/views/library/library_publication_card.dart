import 'package:bookapp/app/views/publication/publication_detail.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class LibraryPublicationCard extends StatelessWidget {
  final pubId,
      username,
      userImage,
      timeago,
      title,
      content,
      pubImage,
      address,
      email,
      phone1,
      phone2,
      reactions;

  LibraryPublicationCard(
      {this.username,
      this.content,
      this.pubId,
      this.pubImage,
      this.timeago,
      this.title,
      this.userImage,
      this.address,
      this.email,
      this.phone1,
      this.phone2,
      this.reactions});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: Container(
        height: 404,
        width: 341,
        constraints: BoxConstraints(
            maxWidth: 341, maxHeight: 404, minWidth: 341, minHeight: 404),
        decoration: BoxDecoration(
            color: librayContainerColor,
            borderRadius: BorderRadius.circular(9)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 13,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage("$userImage"),
                      ),
                      SizedBox(width: 15),
                      Text(
                        "$username",
                        style: userNamePubLibraryStyle,
                      ),
                    ],
                  ),
                  Text("$timeago", style: timeagoMdStyle)
                ],
              ),
            ),
            Container(
              height: 199,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("$pubImage"), fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 8,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$title",
                    style: libraryPublicationStyle,
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: 50,
                    child: Text(
                      "$content",
                      style: libraryPublicationTextStyle,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7)),
                padding: EdgeInsets.symmetric(horizontal: 40),
                color: mainColorGreen,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => PublicationDetail(
                            title: title,
                            username: username,
                            userImage: userImage,
                            timeago: timeago,
                            content: content,
                            pubImage: pubImage,
                            address: address,
                            phone1: phone1,
                            phone2: phone2,
                            email: email,
                            reactions: reactions,
                          )));
                },
                child: Text("Ver mais", style: buttonPubLibraryStyle),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
