import 'package:bookapp/app/components/ImageStackCustom.dart';
import 'package:bookapp/app/utils/constants.dart';
import 'package:bookapp/app/views/library/library.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LibraryProfile extends StatefulWidget {
  final idLibrary, username, userImage, address, email, phone1, phone2;

  LibraryProfile(
      {this.idLibrary,
      this.userImage,
      this.username,
      this.address,
      this.email,
      this.phone1,
      this.phone2});

  @override
  _LibraryProfileState createState() => _LibraryProfileState();
}

class _LibraryProfileState extends State<LibraryProfile> {
  List<String> images = [
    "assets/images/users/n4Ngwvi7.jpg",
    "assets/images/users/NTIxMTkuanBn.jpg",
    "assets/images/users/KtCFjlD4.jpg",
    "assets/images/users/n4Ngwvi7.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("${widget.username}",
            style: GoogleFonts.montserrat(
                textStyle: TextStyle(
              color: Color(0XFF1A002D),
            ))),
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color(0XFF1A002D)),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext contetx) => Library()));
            }),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              height: 378,
              decoration: BoxDecoration(
                  color: librayContainerColor,
                  borderRadius: BorderRadius.circular(9)),
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
                          child: Text("${widget.username}",
                              style: librayUserNameStyle)),
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
                              borderRadius: BorderRadius.circular(9)),
                          padding: EdgeInsets.symmetric(horizontal: 45),
                          color: mainColorGreen,
                          onPressed: () {},
                          child: Text("Seguir",
                              style: libraryFollowButtonTextStyle),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
