import 'package:bookapp/app/utils/constants.dart';
import 'package:flutter/material.dart';

class LibraryInfoWidget extends StatelessWidget {
  final username, address, email, phone1, phone2, userImage;

  LibraryInfoWidget({
    this.userImage,
    this.address,
    this.email,
    this.phone1,
    this.phone2,
    this.username,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15, left: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 26,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage("$userImage"),
          ),
          SizedBox(width: 20),
          Container(
              padding: EdgeInsets.only(right: 10, top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("$username", style: librayUserNameStyle),
                  SizedBox(
                    height: 5,
                  ),
                  Text("$address", style: librayaContactStyle),
                  SizedBox(
                    height: 5,
                  ),
                  Text("$email", style: librayaContactStyle),
                  SizedBox(
                    height: 5,
                  ),
                  Text("$phone1 / $phone2", style: librayaContactStyle),
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
