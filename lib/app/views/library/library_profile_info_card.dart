import 'package:bookapp/app/components/ImageStackCustom.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class LibraryProfileInfoCard extends StatelessWidget {
  final images, username, userImage, address, email, phone1, phone2;

  LibraryProfileInfoCard({
    this.images,
    this.userImage,
    this.username,
    this.address,
    this.email,
    this.phone1,
    this.phone2,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 378,
      decoration: BoxDecoration(
          color: librayContainerColor, borderRadius: BorderRadius.circular(9)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage("$userImage"),
              ),
              SizedBox(height: 10),
              Container(child: Text("$username", style: librayUserNameStyle)),
              SizedBox(
                height: 5,
              ),
              Container(
                  child: Text("$address", style: libraryProfileContactStyle)),
              SizedBox(
                height: 5,
              ),
              Container(
                  child: Text("$email", style: libraryProfileContactStyle)),
              SizedBox(
                height: 5,
              ),
              Container(
                child: Text("$phone1 / $phone2",
                    style: libraryProfileContactStyle),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                margin: EdgeInsets.only(left: 40),

                // width: ,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageStackCustom(
                      isUrl: false,
                      totalCount: images.length,
                      imageList: images,
                      imageRadius: 25, // Radius of each images
                      imageCount:
                          3, // Maximum number of images to be shown in stack
                      // Border width around the images
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                  padding: EdgeInsets.symmetric(horizontal: 45),
                  color: mainColorGreen,
                  onPressed: () {},
                  child: Text("Seguir", style: libraryFollowButtonTextStyle),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
