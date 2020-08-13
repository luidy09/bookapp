import 'dart:io';

import 'package:bookapp/app/components/custom_progress_bar.dart';
import 'package:bookapp/app/utils/constants.dart';
import 'package:bookapp/app/utils/size_config.dart';
import 'package:bookapp/app/views/details/details_page.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final genre,
      title,
      author,
      isFavorite,
      percent,
      lastRead,
      pages,
      paragraph,
      description,
      publishing,
      id,
      imagePath;

  BookCard(
      {@required this.id,
      @required this.imagePath,
      @required this.genre,
      @required this.title,
      @required this.author,
      @required this.isFavorite,
      @required this.percent,
      @required this.lastRead,
      this.pages,
      this.paragraph,
      this.description,
      this.publishing});
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Padding(
      padding: EdgeInsets.only(
          left: SizeConfig.isMall ? 5.0 : 8.0,
          right: SizeConfig.isMall ? 5.0 : 8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailsPage(
                        id: id,
                        title: title,
                        fav: isFavorite,
                      )));
        },
        child: Container(
          padding: const EdgeInsets.only(left: 5.0, right: 5.0),
          margin: EdgeInsets.only(top: SizeConfig.isMall ? 5.0 : 10.0),
          decoration: BoxDecoration(
              color: simpleGray, borderRadius: BorderRadius.circular(10)),
          width: double.infinity,
          height: (SizeConfig.isMall) ? 75 : 100,
          child: Row(
            children: <Widget>[
              Container(
                width: SizeConfig.isMall ? 50 : 70,
                margin: const EdgeInsets.all(5.0),
                //color: Colors.teal[200],
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: imagePath == null || imagePath == ''
                            ? AssetImage("assets/images/capa.jpg")
                            : FileImage(File(imagePath)),
                        fit: BoxFit.cover)),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.only(left: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: SizeConfig.isMall ? 0 : 5.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Text(
                              '$genre',
                              style: TextStyle(color: Color(0XFFEB852E)),
                            ),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          Container(
                            padding:
                                const EdgeInsets.only(top: 5.0, right: 5.0),
                            child: Icon(Icons.favorite,
                                size: SizeConfig.isMall ? 18 : 25,
                                color: isFavorite == 1
                                    ? Color(0XFFEA5840)
                                    : Colors.grey),
                          ),
                        ],
                      ),
                      Text('$title',
                          style: TextStyle(
                              color: Color(0XFF1A002D),
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: SizeConfig.isMall ? 0 : 5),
                      Text(
                        '$author',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: SizeConfig.isMall ? 0 : 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                              child: CustomProgressBar(
                                  percent: percent,
                                  height: SizeConfig.isMall ? 5.0 : 10.0)),
                          SizedBox(width: 8.0),
                          Container(
                            margin: EdgeInsets.only(
                                right: 10.0, top: SizeConfig.isMall ? 7 : 0),
                            child: Text(
                              "$percent%",
                              style: TextStyle(
                                color: (percent < 30)
                                    ? Colors.redAccent
                                    : (percent >= 30 && percent < 50)
                                        ? Colors.orange
                                        : Color(0xff7adbcb),
                                fontSize: SizeConfig.isMall ? 7 : 13,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
