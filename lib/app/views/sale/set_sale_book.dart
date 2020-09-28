import 'dart:io';
import 'package:bookapp/app/models/books.dart';
import 'package:bookapp/app/services/network_requests/book_service.dart';
import 'package:bookapp/app/services/sql/db_helper.dart';
import 'package:bookapp/app/utils/constants.dart';
import 'package:bookapp/app/utils/functions/dialogues.dart';
import 'package:bookapp/app/views/details/details_page.dart';
import 'package:bookapp/app/views/home/home_page.dart';
import 'package:bookapp/app/views/library_user/library_books.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class SetSaleBook extends StatefulWidget {
  final Book book;
  final bool isUpdating;

  const SetSaleBook({Key key, this.isUpdating = false, this.book})
      : super(key: key);
  @override
  _SetSaleBookState createState() => _SetSaleBookState();
}

class _SetSaleBookState extends State<SetSaleBook> {
  final _formKey = GlobalKey<FormState>();
  DBHelper dbHelper;
  Book curBook;
  File _image;
  final picker = ImagePicker();
  bool isUpdating;

  TextEditingController titleController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  TextEditingController genreController = TextEditingController();

  String image;
  String img;

  var fillColor = Colors.grey[100];
  var iconColor = Color(0XFF1A002D);

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    isUpdating = widget.isUpdating;
    curBook = widget.book;
    //print(curBook.image);
    //  img = curBook.image;
  }

  validate() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    // ignore: unused_local_variable
    double screenHeight = screenSize.height;
    // ignore: unused_local_variable
    double screenWidth = screenSize.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0.0,
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Color(0XFF1A002D)),
              onPressed: () {
                if (!isUpdating) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => HomePage()));
                } else {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (BuildContext context) => DetailsPage(
                              id: curBook.idlivro,
                              title: curBook.title,
                            )),
                  );
                }
              }),
          title: Text("Por livro a venda",
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                color: Color(0XFF1A002D),
              )))),
      body: Column(
        children: <Widget>[
          Container(
            height: 250,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/3596.jpg"))),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0, left: 10.0, top: 10),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    controller: titleController,
                    validator: (val) =>
                        val.length == 0 ? 'Digite o preço' : null,
                    //onSaved: (val) => title = val,
                    style: formLabelStyle,
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.only(top: 30),
                        labelText: 'Preço'),
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    controller: authorController,
                    validator: (val) =>
                        val.length == 0 ? 'Digite o nome do autor' : null,
                    //onSaved: (val) => author = val,
                    style: formLabelStyle,
                    decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.only(top: 30),
                        labelText: 'Autor'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
