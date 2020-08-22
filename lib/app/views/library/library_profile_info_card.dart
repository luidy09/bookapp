import 'package:bookapp/app/components/ImageStackCustom.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class LibraryProfileInfoCard extends StatefulWidget {
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
  _LibraryProfileInfoCardState createState() => _LibraryProfileInfoCardState();
}

class _LibraryProfileInfoCardState extends State<LibraryProfileInfoCard> {
  bool isFollowing = false;

  follow() {
    setState(() {
      if (!isFollowing) {
        isFollowing = true;
      } else {
        isFollowing = false;
      }
    });
  }

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
                backgroundImage: AssetImage("${widget.userImage}"),
              ),
              SizedBox(height: 10),
              Container(
                  child:
                      Text("${widget.username}", style: librayUserNameStyle)),
              SizedBox(
                height: 5,
              ),
              Container(
                  child: Text("${widget.address}",
                      style: libraryProfileContactStyle)),
              SizedBox(
                height: 5,
              ),
              Container(
                  child: Text("${widget.email}",
                      style: libraryProfileContactStyle)),
              SizedBox(
                height: 5,
              ),
              Container(
                child: Text("${widget.phone1} / ${widget.phone2}",
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
                      totalCount: widget.images.length,
                      imageList: widget.images,
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
                  color: isFollowing ? mainColorDarkBlue : mainColorGreen,
                  onPressed: () {
                    follow();
                  },
                  child: Text(isFollowing ? "Seguindo" : "Seguir",
                      style: libraryFollowButtonTextStyle),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
