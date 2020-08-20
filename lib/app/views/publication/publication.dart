import 'package:bookapp/app/components/custom_fab_bottom_navigation.dart';
import 'package:bookapp/app/utils/constants.dart';
import 'package:bookapp/app/views/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Publication extends StatefulWidget {
  @override
  _PublicationState createState() => _PublicationState();
}

class _PublicationState extends State<Publication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text("Publicações",
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                color: Color(0XFF1A002D),
              ))),
          elevation: 0.0,
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Color(0XFF1A002D)),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext contetx) => HomePage()));
              }),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: mainColorGreen,
          child: const Icon(Icons.add),
          onPressed: () {},
        ),
        bottomNavigationBar: CustomFABBottomNavigation(
          activeNumber: 4,
        ));
  }
}
