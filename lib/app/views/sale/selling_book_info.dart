import 'package:bookapp/app/components/user_info_widget.dart';
import 'package:bookapp/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SellingBookInfo extends StatelessWidget {
  final genre, username, userImage, address, email, phone1, phone2, author;
  SellingBookInfo(
      {Key key,
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
    return Container(
      height: 200,
      child: Column(
        children: [
          SizedBox(height: 20),
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
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Preço",
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: mainColorDarkBlue)),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "2500.00 AOA",
                        style: GoogleFonts.montserrat(textStyle: priceStyle),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Entrega",
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: mainColorDarkBlue)),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "1000.00 AOA",
                        style: GoogleFonts.montserrat(
                            textStyle: deliveryPriceStyle),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(7),
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
