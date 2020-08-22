import 'package:bookapp/app/components/user_info_min_widget.dart';
import 'package:bookapp/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PublicationDetail extends StatefulWidget {
  final username,
      address,
      email,
      phone1,
      phone2,
      userImage,
      title,
      pubImage,
      content,
      timeago,
      reactions;
  PublicationDetail({
    Key key,
    this.content,
    this.title,
    this.timeago,
    this.reactions,
    this.pubImage,
    this.userImage,
    this.address,
    this.email,
    this.phone1,
    this.phone2,
    this.username,
  }) : super(key: key);

  @override
  _PublicationDetailState createState() => _PublicationDetailState();
}

class _PublicationDetailState extends State<PublicationDetail> {
  bool reacted = false;
  int reactions;

  react() {
    setState(() {
      if (!reacted) {
        reactions++;
        reacted = true;
      } else {
        reactions--;
        reacted = false;
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    reactions = widget.reactions;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      backgroundColor: Color(0xFFFBFBFB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("${widget.username}",
            style: GoogleFonts.montserrat(
                textStyle: TextStyle(
              color: Color(0XFF1A002D),
            ))),
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
                                image: AssetImage("${widget.pubImage}"),
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
                                    Text("${widget.timeago}",
                                        style: timeagoMdStyle),
                                    Container(
                                      height: 25,
                                      child: Row(
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.favorite,
                                                color: (reacted)
                                                    ? mainColorRed
                                                    : Color(0xff979797)),
                                            onPressed: () {
                                              react();
                                            },
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 10),
                                            child: Text(
                                              (reactions > 0)
                                                  ? "$reactions"
                                                  : "",
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
                              userImage: "${widget.userImage}",
                              address: "${widget.address}",
                              email: "${widget.email}",
                              phone1: "${widget.phone1}",
                              phone2: "${widget.phone2}",
                              username: "${widget.username}",
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
                                  child: Text("${widget.title} ",
                                      style: publicationTitleStyle),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text("${widget.content}",
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
