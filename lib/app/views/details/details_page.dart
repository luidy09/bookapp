import 'package:bookapp/app/components/book_detail_card.dart';
import 'package:bookapp/app/components/custom_loading.dart';
import 'package:bookapp/app/models/books.dart';
import 'package:bookapp/app/services/sql/db_helper.dart';
import 'package:bookapp/app/views/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsPage extends StatefulWidget {
  final id, title, fav;

  const DetailsPage({
    Key key,
    this.id,
    this.title,
    this.fav,
  }) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Future<Book> book;
  DBHelper dbHelper;

  Color c = Colors.grey;

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    bookState.setFavorite(widget.fav);

    _getBook();
  }

  _getBook() {
    book = dbHelper.getBook(widget.id);
  }

  /*Color _favColor() {
    if (bookState.favorite == 1) {
      return Color(0XFFEA5840);
    } else {
      return Colors.grey;
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return (true)
        ? FutureBuilder(
            future: book, // a previously-obtained Future<String> or null
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData) {
                //Retornado

                Book book = snapshot.data;

                return BookDetailCard(book: book);
              } else if (snapshot.hasError) {
                //Erro

                return Center(child: Text("Erro ao obter dados do livro"));
              } else {
                //AGUARDADNDO
                double screenHeight = MediaQuery.of(context).size.height;
                double imgSize = screenHeight * .2;
                return Scaffold(
                    body: Center(
                  child: CustomLoading(
                    imgSize: imgSize,
                    height: screenHeight * .5,
                    margin: screenHeight * .2,
                  ),
                ));
              }
            },
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0XFF1A002D),
              centerTitle: true,
              elevation: 0.0,
              leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext contetx) => HomePage()));
                  }),
              title: Text('${widget.title}',
            style: GoogleFonts.montserrat(
                textStyle: TextStyle(
              color: Color(0XFF1A002D),
            ))),
              actions: <Widget>[
                Observer(
                    builder: (_) => IconButton(
                        icon: Icon(Icons.favorite,
                            color: bookState.favorite == 1
                                ? Color(0XFFEA5840)
                                : Colors.grey),
                        onPressed: () {
                          if (bookState.favorite == 1) {
                            bookState.setFavorite(0);
                            dbHelper.setFavoriteBook(widget.id, 0);
                          } else {
                            bookState.setFavorite(1);
                            dbHelper.setFavoriteBook(widget.id, 1);

                            print(bookState.favorite);
                          }
                        }))
              ],
            ),
            body: SingleChildScrollView(
              child: FutureBuilder(
                future: book, // a previously-obtained Future<String> or null
                builder: (BuildContext context, snapshot) {
                  if (snapshot.hasData) {
                    //Retornado

                    Book book = snapshot.data;

                    return BookDetailCard(book: book);
                  } else if (snapshot.hasError) {
                    //Erro

                    return Center(child: Text("Erro ao obter dados do livro"));
                  } else {
                    //AGUARDADNDO
                    double screenHeight = MediaQuery.of(context).size.height;
                    double imgSize = screenHeight * .2;
                    return CustomLoading(
                      imgSize: imgSize,
                      height: screenHeight * .5,
                      margin: screenHeight * .2,
                    );
                  }
                },
              ),
            ),
          );
  }
}
