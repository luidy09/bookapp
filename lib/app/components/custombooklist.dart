import 'package:bookapp/app/components/book_card.dart';
import 'package:bookapp/app/utils/size_config.dart';
import 'package:bookapp/app/viewsmodels/store/bookState.dart';
import 'package:flutter/material.dart';
import 'package:bookapp/app/models/books.dart';
import 'package:bookapp/app/services/sql/db_helper.dart';

final bookState = BookState();

class CustomBookList extends StatefulWidget {
  final genre;
  CustomBookList({@required this.genre});
  @override
  _CustomBookListState createState() => _CustomBookListState();
}

class _CustomBookListState extends State<CustomBookList> {
  List<bool> isPressed = List<bool>();
  Future<List<Book>> books;
  DBHelper dbHelper;
  IconButton ib;
  int i = 0;

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    refreshBooks();
  }

  refreshBooks() {
    setState(() {
      if (widget.genre == "all") {
        books = dbHelper.getBooks();
      } else if (widget.genre == "fav") {
        books = dbHelper.getEspecificBook("favorite = 1 ");
      } else {
        books = dbHelper.getEspecificBook("genre = '${widget.genre}' ");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return FutureBuilder(
        future: books,
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return lista(snapshot.data);
          }
          return Center(child: CircularProgressIndicator());
        });
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
