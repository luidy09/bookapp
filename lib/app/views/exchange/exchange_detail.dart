import 'package:bookapp/app/components/show_book_image_dialog.dart';
import 'package:bookapp/app/utils/constants.dart';
import 'package:bookapp/app/views/exchange/exchange.dart';
import 'package:bookapp/app/views/exchange/proposaer_book_info.dart';
import 'package:bookapp/app/views/exchange/proposal_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExchangeDetail extends StatefulWidget {
  final isMine,
      idExchange,
      title,
      genre,
      username,
      userImage,
      address,
      email,
      phone1,
      phone2,
      author,
      bookImage,
      timeago;
  ExchangeDetail(
      {Key key,
      this.timeago,
      this.isMine,
      this.author,
      this.bookImage,
      this.idExchange,
      this.title,
      this.genre,
      this.username,
      this.userImage,
      this.address,
      this.email,
      this.phone1,
      this.phone2})
      : super(key: key);

  @override
  _ExchangeDetailState createState() => _ExchangeDetailState();
}

class _ExchangeDetailState extends State<ExchangeDetail> {
  List<Widget> proposals = [
    ProposalCard(
        proposalId: 2,
        author: "Pepetela",
        genre: "Drama",
        timeago: "14 de Junho de 2019",
        title: "O cão e os Caluandas",
        userImage: "assets/images/users/n4Ngwvi7.jpg",
        username: "Mr. Karma",
        bookImage: "assets/images/unnamed.png"),
    ProposalCard(
        proposalId: 2,
        author: "Pepetela",
        genre: "Contos",
        timeago: "23 de Julho de 2020",
        title: "Lueji",
        userImage: "assets/images/users/XzAzMDE4MzAuanBn.jpg",
        username: "Pacú \$",
        bookImage: "assets/images/booksimages/lueji.jpg")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("${widget.title}",
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
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            Container(
              child: Stack(
                alignment: Alignment.topLeft,
                children: <Widget>[
                  Container(
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            ShowBookImageDialog.show(
                                context, widget.bookImage, widget.title);
                          },
                          child: Container(
                            height: 230,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("${widget.bookImage}"),
                                fit: BoxFit.cover,
                              ),
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
                    child: ProposerBookInfo(
                      numProposes: proposals.length,
                      userImage: widget.userImage,
                      username: widget.username,
                      address: widget.address,
                      genre: widget.genre,
                      email: widget.email,
                      phone1: widget.phone1,
                      phone2: widget.phone2,
                      author: widget.author,
                      timeago: widget.timeago,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 30),
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,

                  // physics : NeverScrollableScrollPhysics(),
                  itemCount: proposals.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return proposals[index];
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: !(widget.isMine)
          ? FloatingActionButton(
              backgroundColor: mainColorGreen,
              onPressed: () {
                print("Make new proposal");
              },
              child: const Icon(Icons.send),
            )
          : FloatingActionButton(
              backgroundColor: mainColorRed,
              onPressed: () {
                print("Make new proposal");
              },
              child: const Icon(Icons.close),
            ),
    );
  }
}
