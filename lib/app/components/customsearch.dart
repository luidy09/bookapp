import 'dart:io';

import 'package:bookapp/app/components/book_card.dart';
import 'package:bookapp/app/components/book_detail_card.dart';
import 'package:bookapp/app/components/custom_progress_bar.dart';
import 'package:bookapp/app/models/books.dart';
import 'package:bookapp/app/services/sql/db_helper.dart';
import 'package:bookapp/app/utils/size_config.dart';
import 'package:bookapp/app/views/details/details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CustomSearch extends StatefulWidget {
  @override
  _CustomSearchState createState() => _CustomSearchState();
}

class _CustomSearchState extends State<CustomSearch> {
  Future<List<Book>> books;
  bool isSearching;

  TextEditingController searchController = TextEditingController();

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
              child: Observer(
                builder: (_) => TextField(
                  controller: searchController,
                  onChanged: (val) {
                    getBooks(val.trim());
                    if (val.isNotEmpty) {
                      if (!bookState.isSearching) {
                        bookState.setSearching(true);
                      }
                    } else {
                      if (bookState.isSearching) {
                        bookState.setSearching(false);
                      }
                    }
                  },
                  keyboardType: TextInputType.text,
                  autofocus: false,
                  enableInteractiveSelection: true,
                  decoration: InputDecoration(
                    prefixIcon: !bookState.isSearching
                        ? Opacity(
                            opacity: 0.5,
                            child: Icon(Icons.search,
                                size: (SizeConfig.isMall) ? 20 : 30,
                                color: Color(0XFFEB852E)),
                          )
                        : Opacity(
                            opacity: bookState.isSearching ? 0.5 : 0.0,
                            child: InkWell(
                              onTap: () {
                                searchController.text = "";
                                bookState.setSearching(false);
                              },
                              child: Icon(Icons.close,
                                  size: (SizeConfig.isMall) ? 20 : 30,
                                  color: Color(0XFFEB852E)),
                            ),
                          ),
                    hintText: 'Pesquisar',
                    hintStyle: TextStyle(),
                    border: InputBorder.none,
                  ),
                ),
              )),
        ),
        SizedBox(height: 5),
        Observer(
          builder: (_) => bookState.isSearching
              ? FutureBuilder(
                  future: books,
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.hasData) {
                      List<Book> list = snapshot.data;

                      return lista(list);
                    }
                    return Container();
                  })
              : Container(),
        ),
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

          return BookCard(
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
}
