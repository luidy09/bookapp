import 'package:bookapp/app/components/user_info_widget.dart';
import 'package:bookapp/app/utils/constants.dart';
import 'package:bookapp/app/views/exchange/exchange.dart';
import 'package:bookapp/app/views/exchange/proposal_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExchangeDetail extends StatefulWidget {
  ExchangeDetail({Key key}) : super(key: key);

  @override
  _ExchangeDetailState createState() => _ExchangeDetailState();
}

class _ExchangeDetailState extends State<ExchangeDetail> {
  List<Widget> proposals = [
    ProposalCard(),
    ProposalCard(),
    ProposalCard(),
    ProposalCard(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text("Crepusculo II",
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                color: Color(0xFF1A002D),
              ))),
          elevation: 0.0,
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Color(0XFF1A002D)),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext contetx) => Exchange()));
              }),
        ),
        body: Column(
          children: [
            Container(
              child: Stack(
                alignment: Alignment.topLeft,
                children: <Widget>[
                  Container(
                    child: Column(
                      children: [
                        Container(
                          height: 230,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/landbook2.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          height: 107,
                          decoration: BoxDecoration(),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 180,
                    left: 10,
                    right: 10,
                    child: Container(
                      height: 156,
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Jane Austen", style: authorNameStyle),
                                Text(
                                  "Romance",
                                  style: genreStyle,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: UserInfoWidget(
                              userImage:
                                  "assets/images/users/photo-1463453091185-61582044d556.jpeg",
                              address: "Luanda, Rua Amilcar Cabral , N 123",
                              email: "lelo@gmail.com",
                              phone1: "923 454 567",
                              phone2: "222 333 345",
                              username: "Pedro Pombal Viegas ",
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(11),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 4,
                            blurRadius: 6,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                    // physics : NeverScrollableScrollPhysics(),
                    itemCount: proposals.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return proposals[index];
                    }),
              ),
            ),
          ],
        ));
  }
}
