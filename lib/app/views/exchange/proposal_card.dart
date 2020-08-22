import 'package:bookapp/app/components/show_book_image_dialog.dart';
import 'package:flutter/material.dart';
import 'package:bookapp/app/utils/constants.dart';

class ProposalCard extends StatelessWidget {
  final proposalId,
      username,
      timeago,
      userImage,
      title,
      genre,
      author,
      bookImage;

  ProposalCard(
      {this.proposalId,
      this.author,
      this.genre,
      this.timeago,
      this.title,
      this.userImage,
      this.username,
      this.bookImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        height: 264,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(13),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 4,
              blurRadius: 6,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
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
                          Text("$timeago", style: addressInfoStyle),
                        ],
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      ShowBookImageDialog.show(context, bookImage, title);
                    },
                    child: Container(
                      height: 114,
                      width: 96,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(6),
                          ),
                          image: DecorationImage(
                              image: AssetImage("$bookImage"),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$genre",
                        style: proposalBookGenreStyle,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "$title",
                        style: proposalBookNameStyle,
                      ),
                      SizedBox(height: 10),
                      Text("$author", style: proposalBookAuthorStyle)
                    ],
                  ))
                ],
              ),
            ),
            SizedBox(height: 5),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9)),
                    padding: EdgeInsets.symmetric(horizontal: 45),
                    color: mainColorGreen,
                    onPressed: () {},
                    child: Text("Aceitar", style: proposalActionButtonStyle),
                  ),
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9)),
                    padding: EdgeInsets.symmetric(horizontal: 45),
                    color: mainColorRed,
                    onPressed: () {},
                    child: Text("Rejeitar", style: proposalActionButtonStyle),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
