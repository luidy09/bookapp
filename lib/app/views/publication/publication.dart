import 'package:bookapp/app/components/custom_fab_bottom_navigation.dart';
import 'package:bookapp/app/utils/constants.dart';
import 'package:bookapp/app/utils/size_config.dart';
import 'package:bookapp/app/views/home/home_page.dart';
import 'package:bookapp/app/views/library/library_publication_card.dart';
import 'package:bookapp/app/views/publication/publication_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Publication extends StatefulWidget {
  @override
  _PublicationState createState() => _PublicationState();
}

class _PublicationState extends State<Publication> {
  bool isSearchingPublication = false;

  TextEditingController searchController = TextEditingController();

  List<Widget> publications = [
    PublicationCard(
      username: "Livraria Lelo",
      content:
          "Neste mes estamos em promoção visite a nossa livraria, temos livros a partir de 1000 Akz...",
      pubId: 1,
      pubImage: "assets/images/landbook1.jpg",
      timeago: "há 1 dia",
      title: "Promoção mês de Agosto",
      userImage: "assets/images/users/NTIxMTkuanBn.jpg",
    ),
    PublicationCard(
      username: "Livraria Lelo",
      content:
          "Neste mes estamos em promoção visite a nossa livraria, temos livros a partir de 1000 Akz...",
      pubId: 1,
      pubImage: "assets/images/book_landscape.jpg",
      timeago: "há 1 dia",
      title: "Promoção mês de Agosto",
      userImage: "assets/images/users/MzYyNTIuanBn.jpg",
    ),
    PublicationCard(
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

  List<Widget> publicationsSearch = [
    PublicationCard(
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

  setIsSearchig(bool state) {
    setState(() {
      isSearchingPublication = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
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
        /*floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: mainColorGreen,
          child: const Icon(Icons.add),
          onPressed: () {},
        ),*/
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: (SizeConfig.isMall) ? 40.0 : 50.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: simpleGray, width: 0.0),
                    borderRadius: BorderRadius.circular(10),
                    color: simpleGray,
                  ),
                  child: TextField(
                    controller: searchController,
                    onChanged: (val) {
                      //getBooks(val.trim());

                      if (val.isNotEmpty) {
                        if (!isSearchingPublication) {
                          setIsSearchig(true);
                        }
                      } else {
                        if (isSearchingPublication) {
                          setIsSearchig(false);
                        }
                      }
                    },
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    enableInteractiveSelection: true,
                    decoration: InputDecoration(
                      prefixIcon: !isSearchingPublication
                          ? Icon(Icons.search,
                              size: (SizeConfig.isMall) ? 20 : 30,
                              color: Color(0xFF19002D))
                          : InkWell(
                              onTap: () {
                                searchController.text = "";

                                setIsSearchig(false);
                              },
                              child: Icon(Icons.close,
                                  size: (SizeConfig.isMall) ? 20 : 30,
                                  color: Color(0xFF19002D)),
                            ),
                      hintText: 'Pesquisar',
                      hintStyle: TextStyle(),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                isSearchingPublication
                    ? Expanded(
                        child: ListView.builder(
                          itemCount: publicationsSearch.length,
                          itemBuilder: (BuildContext context, index) {
                            return publicationsSearch[index];
                          },
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemCount: publications.length,
                          itemBuilder: (BuildContext context, index) {
                            return publications[index];
                          },
                        ),
                      ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomFABBottomNavigationPub(
          activeNumber: 4,
        ));
  }
}
