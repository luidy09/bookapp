import 'package:bookapp/app/views/library/library.dart';
import 'package:bookapp/app/views/library/library_profile_info_card.dart';
import 'package:bookapp/app/views/library/library_publication_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/constants.dart';
import 'library_book_selling_card.dart';

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

  List<Widget> books = [
    LibraryBookSellingcard(
      author: "Dárdano Santos",
      bookImage: "assets/images/landbook3.jpg",
      genre: "Motivacional",
      price: "1700,00 AOA",
      sellingId: 1,
      timeago: "há 1 dia",
      title: "A Arte de Seguir Alguém ",
    ),
    LibraryBookSellingcard(
      author: "Dárdano Santos",
      bookImage: "assets/images/landbook4.jpeg",
      genre: "Motivacional",
      price: "1700,00 AOA",
      sellingId: 2,
      timeago: "há 1 dia",
      title: "A Arte de Seguir Alguém ",
    ),
    LibraryBookSellingcard(
      author: "Dárdano Santos",
      bookImage: "assets/images/landbook1.jpg",
      genre: "Motivacional",
      price: "1700,00 AOA",
      sellingId: 3,
      timeago: "há 1 dia",
      title: "A Arte de Seguir Alguém ",
    ),
    LibraryBookSellingcard(
      author: "Pepetela",
      bookImage: "assets/images/pepetela.jpg",
      genre: "Contos",
      price: "4 500,00 AOA",
      sellingId: 1,
      timeago: "há 4 dias",
      title: "Lueji ",
    ),
  ];

  List<Widget> publications = [
    LibraryPublicationCard(
      username: "Livraria Lelo",
      content:
          "Neste mes estamos em promoção visite a nossa livraria, temos livros a partir de 1000 Akz...",
      pubId: 1,
      pubImage: "assets/images/landbook1.jpg",
      timeago: "há 1 dia",
      title: "Promoção mês de Agosto",
      userImage: "assets/images/users/NTIxMTkuanBn.jpg",
    ),
    LibraryPublicationCard(
      username: "Livraria Lelo",
      content:
          "Neste mes estamos em promoção visite a nossa livraria, temos livros a partir de 1000 Akz...",
      pubId: 1,
      pubImage: "assets/images/book_landscape.jpg",
      timeago: "há 1 dia",
      title: "Promoção mês de Agosto",
      userImage: "assets/images/users/MzYyNTIuanBn.jpg",
    ),
    LibraryPublicationCard(
      username: "Livraria Lelo",
      content:
          "Neste mes estamos em promoção visite a nossa livraria, temos livros a partir de 1000 Akz...",
      pubId: 1,
      pubImage: "assets/images/landbook.jpg",
      timeago: "há 1 dia",
      title: "Promoção mês de Agosto",
      userImage: "assets/images/users/XzAzMDE4MzAuanBn.jpg",
    ),
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
              SizedBox(height: 15),
              Container(
                margin: EdgeInsets.only(left: 25),
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                            child: Text("Livros a venda",
                                style: sellingDescriptionText))),
                    Expanded(child: Container())
                  ],
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                height: 330,
                child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: books.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return books[index];
                    }),
              ),
              SizedBox(height: 15),
              Container(
                margin: EdgeInsets.only(left: 25),
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                            child: Text("Publicações",
                                style: sellingDescriptionText))),
                    Expanded(child: Container())
                  ],
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                height: 404,
                child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: publications.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return publications[index];
                    }),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
