import 'package:bookapp/app/utils/constants.dart';
import 'package:flutter/material.dart';

class UserInfoWidget extends StatelessWidget {
  final username, address, email, phone1, phone2, userImage;

  UserInfoWidget({
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
                  Text("$phone1 / $phone2", style: addressInfoStyle),
                ],
              ))
        ],
      ),
    );
  }
}
