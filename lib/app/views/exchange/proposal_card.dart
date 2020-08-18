import 'package:flutter/material.dart';
import 'package:bookapp/app/utils/constants.dart';

class ProposalCard extends StatelessWidget {
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
                    backgroundImage:
                        AssetImage("assets/images/users/n4Ngwvi7.jpg"),
                  ),
                  SizedBox(width: 15),
                  Container(
                      padding: EdgeInsets.only(right: 10, top: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Mr. Karma", style: userNameStyle),
                          Text("14 de Junho de 2019", style: addressInfoStyle),
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
                  Container(
                    height: 114,
                    width: 96,
                    decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.all(
                          Radius.circular(6),
                        ),
                        image: DecorationImage(
                          image: AssetImage("assets/images/unnamed.png"),
                        )),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Drama",
                        style: proposalBookGenreStyle,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "O cão e os Caluandas",
                        style: proposalBookNameStyle,
                      ),
                      SizedBox(height: 10),
                      Text("Pepetela", style: proposalBookAuthorStyle)
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
