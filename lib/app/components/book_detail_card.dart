import 'dart:io';

import 'package:bookapp/app/components/custom_slider.dart';
import 'package:bookapp/app/models/books.dart';
import 'package:bookapp/app/services/sql/db_helper.dart';
import 'package:bookapp/app/views/form/form_page.dart';
import 'package:bookapp/app/views/home/home_page.dart';
import 'package:bookapp/app/viewsmodels/store/bookState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
    double calc = value * bookState.pages;
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
    if (bookState.paragraph != 200) {
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
        title: Text(
          '${book.title}',
        ),
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
        child: Container(
          width: double.infinity,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Stack(children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(
                          top: 300, bottom: 20, right: 32, left: 32),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          ),
                          color: Color(0XFF1A002D)),
                      child: Column(children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.trending_up,
                                  color: Color(0XFFEB852E), size: 30),
                              onPressed: () {
                                _showdialogstatisc(context);
                              },
                              tooltip: 'Estátistica',
                            ),
                            IconButton(
                              icon: Icon(Icons.tune,
                                  color: Color(0XFF2B8896), size: 30),
                              onPressed: () {
                                _showdialogoptions(context);
                              },
                              tooltip: 'Opções',
                            ),
                          ],
                        )
                      ]),
                    ),
                    Positioned(
                      bottom: 100,
                      right: 25,
                      left: 25,
                      child: Center(
                        child: Container(
                            height: 250,
                            width: 200.0,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: img == null || img == ''
                                    ? Image.asset("assets/images/book.png",
                                        fit: BoxFit.cover)
                                    : Image.file(File(img), fit: BoxFit.fill))),
                      ),
                    ),
                  ]),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          numInfo(
                            value: bookState.paragraph,
                            color: 0XFFEB852E,
                            type: 1,
                            icon: Icon(Icons.import_contacts,
                                color: Color(0XFFEB852E)),
                          ),
                          SizedBox(width: 4),
                          numInfo(
                            value: bookState.paragraph,
                            color: 0xFFEA5840,
                            type: 2,
                            icon: Stack(
                                alignment: Alignment.center,
                                children: <Widget>[
                                  Container(
                                    child: Icon(
                                      Icons.import_contacts,
                                      color: Color(0xFFEA5840),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 20.0, top: 20.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: Colors.white,
                                    ),
                                    child: Icon(
                                      Icons.check_circle,
                                      color: Color(0xFFEA5840),
                                      size: 18,
                                    ),
                                  ),
                                ]),
                          ),
                          numInfo(
                            value: bookState.paragraph,
                            color: 0XFF2B8896,
                            type: 3,
                            icon: Icon(
                              Icons.format_align_left,
                              color: Color(0XFF2B8896),
                              size: 20,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Sobre o livro',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0XFF1A002D),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Chip(
                            avatar: CircleAvatar(
                              backgroundColor: Color(0XFF1A002D),
                              child: Text('G'),
                            ),
                            label: Text('${bookState.genre}'),
                          ),
                          Chip(
                            avatar: CircleAvatar(
                              backgroundColor: Color(0XFF1A002D),
                              child: Text('E'),
                            ),
                            label: Text('${bookState.publishing} '),
                          )
                        ],
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 0,
                      ),
                      Container(
                        child: Text(
                          "${bookState.description} ",
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      SizedBox(height: 30)
                    ],
                  ),
                )
              ]),
        ),
      ),
    );
  }

  Widget numInfo({value, color, icon, type}) {
    return Expanded(
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              icon,
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
                  style: TextStyle(
                    color: Color(color),
                  ),
                ),
              ),
            ]),
      ),
    );
  }

  Future<bool> _showdialogstatisc(context) {
    return showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
          return Transform(
            transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
            child: Opacity(
              opacity: a1.value,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: AlertDialog(
                  contentPadding: EdgeInsets.all(5),
                  insetPadding: EdgeInsets.all(8),
                  title: Row(children: [
                    Icon(Icons.trending_up, size: 30, color: Color(0XFFEB852E)),
                    SizedBox(width: 10),
                    Text('Desempenho de leitura',
                        style:
                            TextStyle(fontSize: 18.0, color: Color(0XFF1A002D)))
                  ]),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Center(
                        child: Observer(
                          builder: (_) => CustomSlider(
                            colors: [Color(0xFFf5af19), Color(0xFFEA5840)],
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
                        height: 30,
                      ),
                      Center(
                        child: Observer(
                          builder: (_) => CustomSlider(
                            colors: [Color(0xFFFF416C), Color(0xFFff4b2b)],
                            value: bookState.paragraph / 200,
                            decrease: decreaseParagraph,
                            increase: increaseParagraph,
                            onChanged: changeParagraph,
                            sliderHeight: 48.0,
                            min: 0,
                            max: 200,
                            fullWidth: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
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
                    Icon(Icons.tune, color: Color(0XFF2B8896), size: 30),
                    SizedBox(width: 10),
                    Text('Opções'),
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
