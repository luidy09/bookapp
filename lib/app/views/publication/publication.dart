import 'package:bookapp/app/components/custom_fab_bottom_navigation_no_button.dart';
import 'package:bookapp/app/utils/constants.dart';
import 'package:bookapp/app/utils/size_config.dart';
import 'package:bookapp/app/views/home/home_page.dart';
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
        userImage: "assets/images/libraries/lelo.jpg",
        address: "R. Rainha Ginga 47, Luanda",
        email: "livrarialelo@gmail.com",
        phone1: "923 606 881",
        phone2: "",
        reactions: 8),
    PublicationCard(
        username: "Livraria Barquinho",
        content:
            "1 Neste mes estamos em promoção visite a nossa livraria, temos livros a partir de 2000 Akz...",
        pubId: 2,
        pubImage: "assets/images/booksimages/escuridao.jpg",
        timeago: "há 1 dia",
        title: "Promoção mês de Agosto",
        userImage: "assets/images/libraries/barquinho2.jpg",
        address: "Travessa Comandante Gika Avenida, Luanda, Angola",
        email: "barquinho@josened.com",
        phone1: "940 136 398",
        phone2: "",
        reactions: 0),
    PublicationCard(
        username: "Livraria Germinante",
        content:
            "Neste mes estamos em promoção visite a nossa livraria, temos livros a partir de 1000 Akz...",
        pubId: 3,
        pubImage: "assets/images/booksimages/principe.jpg",
        timeago: "há 1 dia",
        title: "Promoção mês de Agosto",
        userImage: "assets/images/libraries/germinante.jpg",
        address: "",
        email: "livrariagerminante@gmail.com",
        phone1: "921474337",
        phone2: "",
        reactions: 6),
  ];

  List<Widget> publicationsSearch = [
    PublicationCard(
        username: "Livraria Lelo",
        content:
            "Neste mes estamos em promoção visite a nossa livraria, temos livros a partir de 1000 Akz...",
        pubId: 1,
        pubImage: "assets/images/landbook1.jpg",
        timeago: "há 1 dia",
        title: "Promoção mês de Agosto",
        userImage: "assets/images/libraries/lelo.jpg",
        address: "R. Rainha Ginga 47, Luanda",
        email: "livrarialelo@gmail.com",
        phone1: "923 606 881",
        phone2: "",
        reactions: 6),
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
        bottomNavigationBar: CustomFABBottomNavigationNoButton(
          activeNumber: 4,
        ));
  }
}
