import 'package:bookapp/app/utils/constants.dart';
import 'package:flutter/material.dart';

class SellingBookUserInfoWidget extends StatelessWidget {
  final username, address, email, phone1, phone2, userImage;

  SellingBookUserInfoWidget({
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
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 10),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage("$userImage"),
              radius: 15,
            ),
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
