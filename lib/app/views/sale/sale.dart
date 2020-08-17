import 'package:bookapp/app/views/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sale extends StatefulWidget {
  @override
  _SaleState createState() => _SaleState();
}

class _SaleState extends State<Sale> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Feira do livro",  style: GoogleFonts.montserrat(
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
    );
  }
}
