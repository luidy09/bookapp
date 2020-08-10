import 'dart:io';

import 'package:bookapp/app/components/custom_progress_bar.dart';
import 'package:bookapp/app/models/books.dart';
import 'package:bookapp/app/services/sql/db_helper.dart';
import 'package:bookapp/app/utils/size_config.dart';
import 'package:bookapp/app/views/details/details_page.dart';
import 'package:flutter/material.dart';

class CustomSearch extends StatefulWidget {
  @override
  _CustomSearchState createState() => _CustomSearchState();
}

class _CustomSearchState extends State<CustomSearch> {
  List<String> litems = ["1", "2", "Third", "4"];

  Future<List<Book>> books;
  bool isSearching;
  DBHelper dbHelper;

  @override
  void initState() {
    super.initState();

    dbHelper = DBHelper();
  }

  getBooks(search) {
    setState(() {
      books = dbHelper.searchBook(search);
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Container(
              height: (SizeConfig.isMall) ? 35.0 : 50.0,
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0XFFdedede)),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ]),
              child: TextField(
                onChanged: (val) {
                  getBooks(val.trim());
                },
                keyboardType: TextInputType.text,
                autofocus: false,
                enableInteractiveSelection: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search,
                      size: (SizeConfig.isMall) ? 20 : 30,
                      color: Color(0XFFEB852E)),
                  hintText: 'Pesquisar',
                  hintStyle: TextStyle(),
                  border: InputBorder.none,
                ),
              )),
        ),
        SizedBox(height: 5),
        FutureBuilder(
            future: books,
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData) {
                List<Book> list = snapshot.data;

                print("DATA LENGTH: ${list.length}");

                return lista(list);
              }
              return Container();
            }),
      ],
    );
  }

  lista(List<Book> list) {
    return ListView.builder(
        itemCount: list.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, index) {
          Book book = list[index];
          int percent = ((book.lastRead * 100) ~/ book.pages).toInt();

          return _bookCard(
              id: book.idlivro,
              genre: book.genre,
              title: book.title,
              author: book.author,
              imagePath: book.image,
              isFavorite: book.favorite,
              percent: percent,
              description: book.description,
              publishing: book.publishing,
              lastRead: book.lastRead,
              pages: book.pages,
              paragraph: book.paragraph);
        });
  }

  Widget _bookCard(
      {@required id,
      @required imagePath,
      @required genre,
      @required title,
      @required author,
      @required isFavorite,
      @required percent,
      @required lastRead,
      int pages,
      int paragraph,
      String description,
      String publishing}) {
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
        child: Card(
          elevation: 1.0,
          //Think about
          shadowColor: Colors.grey[400],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Container(
            width: double.infinity,
            height: (SizeConfig.isMall) ? 75 : 100,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                      width: SizeConfig.isMall ? 75 : 100,
                      height: 130.0,
                      //color: Colors.teal[200],
                      decoration: BoxDecoration(
                          color: Colors.teal[200],
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(5))),
                      child: ClipRRect(
                          child: imagePath == null || imagePath == ''
                              ? Image.asset("assets/images/book.png",
                                  fit: BoxFit.cover)
                              : Image.file(File(imagePath), fit: BoxFit.fill))),
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
                                          : Color(0xff00bc96),
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
      ),
    );
  }
}
