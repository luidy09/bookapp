import 'package:bookapp/app/components/user_info_min_widget.dart';
import 'package:bookapp/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PublicationDetail extends StatefulWidget {
  PublicationDetail({Key key}) : super(key: key);

  @override
  _PublicationDetailState createState() => _PublicationDetailState();
}

class _PublicationDetailState extends State<PublicationDetail> {
  String text =
      "“Será a vida tão cara, ou a paz tão doce, que devam ser compradas ao preço de correntes e escravidão? Não permitais isso, Deus Todo-Poderoso! Não sei que rumo tomarão os outros; quanto a mim, dai-me a liberdade ou dai-me a morte!” ”Excerto de: Ben Dupré. “50 grandes ideias da humanidade que você precisa conhecer (Coleção 50 ideias)”. iBooks. ";
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      backgroundColor: Color(0xFFFBFBFB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color(0XFF1A002D)),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            Container(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 260,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image:
                                    AssetImage("assets/images/landbook2.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("13 Agosto de 2019",
                                        style: timeagoMdStyle),
                                    Container(
                                      height: 25,
                                      child: Row(
                                        children: [
                                          Icon(Icons.favorite,
                                              color: Color(0xff979797)),
                                          Container(
                                            margin: EdgeInsets.only(top: 10),
                                            child: Text(
                                              "999",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xff979797)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: UserInfoMinWidget(
                              userImage: "assets/images/users/89.jpg",
                              address: "Luanda, Rua Amilcar Cabral , N 123",
                              email: "lelo@gmail.com",
                              phone1: "222 333 345 ",
                              phone2: "923 454 567",
                              username: "Jane Doe",
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Divider(
                              height: 0.5,
                              color: Color(0xff9C9C9C),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text("Promoção para o mes de Abril ",
                                      style: publicationTitleStyle),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text("$text",
                                      textAlign: TextAlign.justify,
                                      style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal),
                                      )),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
