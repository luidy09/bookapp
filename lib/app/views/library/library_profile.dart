import 'package:bookapp/app/views/library/library.dart';
import 'package:bookapp/app/views/library/library_profile_info_card.dart';
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
            LibraryProfileInfoCard(
              images: images,
              userImage: widget.userImage,
              username: widget.username,
              address: widget.address,
              email: widget.email,
              phone1: widget.phone1,
              phone2: widget.phone2,
            ),
          ],
        ),
      ),
    );
  }
}
