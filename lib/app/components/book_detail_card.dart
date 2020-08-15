import 'dart:io';

import 'package:bookapp/app/components/custom_slider.dart';
import 'package:bookapp/app/models/books.dart';
import 'package:bookapp/app/services/sql/db_helper.dart';
import 'package:bookapp/app/views/form/form_page.dart';
import 'package:bookapp/app/views/home/home_page.dart';
import 'package:bookapp/app/viewsmodels/store/bookState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';

final bookState = BookState();

// ignore: must_be_immutable
class BookDetailCard extends StatelessWidget {
  final Book book;
  DBHelper dbHelper;

  BookDetailCard({Key key, this.book}) : super(key: key);

  changeLastRead(double value) {
    double calc = value * bookState.pages;
    int lastRead = calc.round();
    bookState.setLastRead(lastRead);
    bookState.setPercent();
    dbHelper.updateAttr(bookState.id, "lastRead", lastRead);
  }

  decreaseLastRead() {
    if (bookState.lastRead != 0) {
      dbHelper.decrease(bookState.id, "lastRead");
      int value = bookState.lastRead - 1;
      bookState.setLastRead(value);
      bookState.setPercent();
      // print(bookState.percent);
    }
  }

  increaseLastRead() {
    if (bookState.pages != bookState.lastRead && bookState.percent != 100) {
      dbHelper.increase(bookState.id, "lastRead");
      int value = bookState.lastRead + 1;
      bookState.setLastRead(value);
      bookState.setPercent();
    }
  }

  changeParagraph(double value) {
    double calc = value * 1500;
    int paragraph = calc.round();
    bookState.setParagraph(paragraph);
    dbHelper.updateAttr(bookState.id, "paragraph", paragraph);
  }

  decreaseParagraph() {
    if (bookState.paragraph != 0) {
      dbHelper.decrease(bookState.id, "paragraph");
      int value = bookState.paragraph - 1;
      bookState.setParagraph(value);
    }
  }

  increaseParagraph() {
    if (bookState.paragraph != 1500) {
      dbHelper.increase(bookState.id, "paragraph");
      int value = bookState.paragraph + 1;
      bookState.setParagraph(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    dbHelper = DBHelper();
    String img = "";

    dbHelper = DBHelper();
    bookState.setLivro(book);
    img = bookState.image;
    print(img);
    bookState.setPercent();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color(0XFF1A002D)),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext contetx) => HomePage()));
            }),
        title: Text('${book.title}',
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
                      dbHelper.setFavoriteBook(book.idlivro, 0);

                      print("Não Fav");
                      print(bookState.favorite);
                    } else {
                      bookState.setFavorite(1);
                      dbHelper.setFavoriteBook(book.idlivro, 1);

                      //  b.favorite = bookState.favorite;
                      print("Fav");
                      print(bookState.favorite);
                    }
                  }))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          SizedBox(height: 10),
          Center(
            child: Container(
                height: 250,
                width: 200.0,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: img == null || img == ''
                        ? Card(
                            shadowColor: Colors.grey,
                            elevation: 5.0,
                            child: Image.asset("assets/images/book.png",
                                fit: BoxFit.cover),
                          )
                        : Card(
                            shadowColor: Colors.grey,
                            elevation: 5.0,
                            child: Image.file(File(img), fit: BoxFit.fill)))),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 20, bottom: 10, right: 32, left: 32),
            child: Column(children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.trending_up,
                        color: Color(0XFFEB852E), size: 30),
                    onPressed: () {
                      // _showdialogstatisc(context);
                      _showDialog(context);
                    },
                    tooltip: 'Estátistica',
                  ),
                  IconButton(
                    icon: Icon(Icons.tune, color: Color(0XFF2B8896), size: 30),
                    onPressed: () {
                      _showdialogoptions(context);
                    },
                    tooltip: 'Opções',
                  ),
                ],
              )
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          children: [
                            numInfo(
                              value: bookState.paragraph,
                              color: 0XFFEB852E,
                              type: 1,
                              text: Text(
                                'Páginas',
                                style: TextStyle(fontSize: 18.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Divider(
                          color: Colors.grey,
                          thickness: 0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          children: [
                            numInfo(
                                value: bookState.paragraph,
                                color: 0xFFEA5840,
                                type: 2,
                                text: Text(
                                  'Páginas Lidas',
                                  style: TextStyle(fontSize: 18.0),
                                )),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Divider(
                          color: Colors.grey,
                          thickness: 0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          children: [
                            numInfo(
                                value: bookState.paragraph,
                                color: 0XFF2B8896,
                                type: 3,
                                text: Text(
                                  'Paragrafo',
                                  style: TextStyle(fontSize: 18.0),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Chip(
                      backgroundColor: Colors.grey[100],
                      avatar: CircleAvatar(
                        backgroundColor: Color(0XFF1A002D),
                        child: Text('G',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                      label: Container(
                          height: 30,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('${bookState.genre}'))),
                    ),
                    Chip(
                      backgroundColor: Colors.grey[100],
                      avatar: CircleAvatar(
                          backgroundColor: Color(0XFF1A002D),
                          child: Text('E',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white))),
                      label: Container(
                          height: 30,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('${bookState.publishing}'))),
                    )
                  ],
                ),
                SizedBox(height: 30),
                Container(
                  child: SingleChildScrollView(
                    child: Text(
                      "${bookState.description}",
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                SizedBox(height: 30)
              ],
            ),
          )
        ]),
      ),
    );
  }

  Widget numInfo({value, color, text, type}) {
    return Expanded(
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              text,
              Text('',
                  style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
              Observer(
                builder: (_) => Text(
                  (type == 1)
                      ? '${bookState.pages}'
                      : (type == 2)
                          ? '${bookState.lastRead}'
                          : '${bookState.paragraph}',
                  style: TextStyle(color: Color(color), fontSize: 18),
                ),
              ),
            ]),
      ),
    );
  }

  Future<bool> _showDialog(context) {
    return showGeneralDialog(
        context: context,
        barrierDismissible: true,
        pageBuilder: (context, animation1, animation2) {
          return;
        },
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        transitionBuilder: (context, a1, a2, widget) {
          final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
          return Transform(
            transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
            child: Center(
              child: Opacity(
                opacity: a1.value,
                child: Container(
                    width: MediaQuery.of(context).size.width - 10,
                    height: 230,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 15, left: 10),
                            child: Row(children: [
                              Icon(Icons.trending_up,
                                  size: 30, color: Color(0XFFEB852E)),
                              SizedBox(width: 10),
                              Text('Desempenho de leitura',
                                  style: TextStyle(
                                      fontSize: 18.0, color: Color(0XFF1A002D)))
                            ]),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 8, right: 8),
                            child: Observer(
                              builder: (_) => CustomSlider(
                                valueColor: Color(0xFFff5e62),
                                colors: [Color(0xFFff9966), Color(0xFFff5e62)],
                                value: bookState.lastRead / bookState.pages,
                                decrease: decreaseLastRead,
                                increase: increaseLastRead,
                                onChanged: changeLastRead,
                                sliderHeight: 48.0,
                                min: 0,
                                max: bookState.pages,
                                fullWidth: true,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 8, right: 8),
                            child: Observer(
                              builder: (_) => CustomSlider(
                                valueColor: Color(0xFF48b1bf),
                                colors: [Color(0xFF06beb6), Color(0xFF48b1bf)],
                                value: bookState.paragraph / 1500,
                                decrease: decreaseParagraph,
                                increase: increaseParagraph,
                                onChanged: changeParagraph,
                                min: 0,
                                max: 1500,
                                sliderHeight: 48.0,
                                fullWidth: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          );
        });
  }

  Future<bool> _showdialogoptions(context) {
    return showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
          return Transform(
            transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                title: Row(
                  children: <Widget>[
                    Icon(Icons.tune, color: Color(0xFF2B8896), size: 30),
                    SizedBox(width: 10),
                    Text('Opções',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Color(0xFF1A002D))),
                    Divider(
                      color: Colors.grey,
                    )
                  ],
                ),
                contentPadding: EdgeInsets.all(0),
                content: Container(
                  margin: EdgeInsets.only(left: 5, bottom: 30.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FlatButton(
                          onPressed: () {
                            //Atualiza os dados do livro com as alteracoes do lastRead e Paragraph
                            book.lastRead = bookState.lastRead;
                            book.paragraph = bookState.paragraph;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FormPage(
                                          isUpdating: true,
                                          book: book,
                                        )));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Icon(Icons.loop, color: Color(0XFFEB852E)),
                              SizedBox(width: 10),
                              Text('Actualizar livro',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey[700]))
                            ],
                          )),
                      Padding(
                        padding: const EdgeInsets.only(right: 18.0, left: 18.0),
                        child: Divider(color: Colors.grey[600]),
                      ),
                      FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            _confirmDialog(context);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Icon(Icons.delete, color: Color(0XFFEA5840)),
                              SizedBox(width: 10),
                              Text('Apagar livro',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey[700]))
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        // ignore: missing_return
        pageBuilder: (context, animation1, animation2) {});
  }

  Future<bool> _confirmDialog(context) {
    return showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
          return Transform(
            transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                title: Row(
                  children: <Widget>[
                    Icon(
                      Icons.delete,
                      color: Color(0XFFEA5840),
                      size: 30,
                    ),
                    SizedBox(width: 10),
                    Text('Apagar livro'),
                  ],
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        text: 'Deseja apagar  o livro ',
                        style: TextStyle(color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                              text: '${book.title}',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: ' ?'),
                        ],
                      ),
                    )
                  ],
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text('Cancelar'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  FlatButton(
                    child: Text('Continuar'),
                    onPressed: () {
                      dbHelper.deleteBook(bookState.id);
                      Navigator.pushNamed(context, '/home');
                    },
                  )
                ],
              ),
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        // ignore: missing_return
        pageBuilder: (context, animation1, animation2) {});
  }
}
