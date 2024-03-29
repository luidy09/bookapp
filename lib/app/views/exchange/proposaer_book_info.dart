import 'package:bookapp/app/components/user_info_widget.dart';
import 'package:bookapp/app/utils/constants.dart';
import 'package:flutter/material.dart';

class ProposerBookInfo extends StatelessWidget {
  final timeago,
      genre,
      username,
      userImage,
      address,
      email,
      phone1,
      phone2,
      author,
      numProposes;
  ProposerBookInfo(
      {Key key,
      this.numProposes,
      this.timeago,
      this.author,
      this.genre,
      this.username,
      this.userImage,
      this.address,
      this.email,
      this.phone1,
      this.phone2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var proposta =
        (numProposes > 0) ? "( $numProposes ) Propostas" : "Sem propostas";
    return Container(
      height: 156,
      child: Column(
        children: [
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("$proposta", style: timeagoStyle),
                Text("$timeago", style: timeagoStyle),
              ],
            ),
          ),
          SizedBox(height: 5),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("$author", style: authorNameStyle),
                Text(
                  "$genre",
                  style: genreStyle,
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: UserInfoWidget(
              userImage: "$userImage",
              address: "$address",
              email: "$email",
              phone1: "$phone1",
              phone2: "$phone2",
              username: "$username",
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(11),
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
    );
  }
}
