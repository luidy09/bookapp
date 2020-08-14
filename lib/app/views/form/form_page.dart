import 'dart:io';
import 'package:bookapp/app/models/books.dart';
import 'package:bookapp/app/services/sql/db_helper.dart';
import 'package:bookapp/app/views/details/details_page.dart';
import 'package:bookapp/app/views/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FormPage extends StatefulWidget {
  final Book book;
  final bool isUpdating;

  const FormPage({Key key, this.isUpdating, this.book}) : super(key: key);
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  DBHelper dbHelper;
  Book curBook;
  File _image;
  final picker = ImagePicker();
  bool isUpdating;

  TextEditingController titleController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  TextEditingController genreController = TextEditingController();
  TextEditingController pagesController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController publishingController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  String title;
  String author;
  String genre;
  int pages;
  int reads = 0;
  int lastRead = 0;
  double price;
  String publishing;
  int paragraph;
  String description;
  int favorite;
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

    if (widget.isUpdating) setValues();
  }

  Future getImageGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile.path == null) {
        image = null;
      } else {
        _image = File(pickedFile.path);
      }
    });

    image = _image.path;
  }

  Future getImageCam() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile.path == null) {
        image = null;
      } else {
        _image = File(pickedFile.path);
      }
    });

    image = _image.path;
  }

  goDetail(book) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => DetailsPage(
              id: book.idlivro,
              title: book.title,
            )));
  }

  setValues() {
    titleController.text = curBook.title;
    authorController.text = curBook.author;
    genreController.text = curBook.genre;
    pagesController.text = curBook.pages.toString();
    publishingController.text = curBook.publishing;
    priceController.text = curBook.price.toString();
    descriptionController.text = curBook.description;
  }

  validate() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      if (isUpdating) {
        showDialogue(desmissible: true, subtitle: "Atualizando livro");

        Book e = Book(
            idlivro: curBook.idlivro,
            title: title,
            author: author,
            genre: genre,
            pages: pages,
            reads: curBook.reads,
            lastRead: curBook.lastRead,
            price: price,
            publishing: publishing,
            paragraph: curBook.paragraph,
            description: description,
            favorite: curBook.favorite,
            image: image);
        dbHelper.updateBook(e).then((value) {
          curBook.title = title;

          goDetail(curBook);
        });
      } else {
        showDialogue(desmissible: true, subtitle: "Adicionando livro");

        Book e = Book(
            idlivro: null,
            title: title,
            author: author,
            genre: genre,
            pages: pages,
            reads: reads,
            lastRead: lastRead,
            price: price,
            publishing: publishing,
            paragraph: 0,
            description: description,
            favorite: 0,
            image: image);

        dbHelper.saveBook(e).then((book) {
          // goDetail(book);
          Navigator.pushNamed(context, "/home");
        });
      }
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
          title: Text((!isUpdating) ? 'Novo Livro' : "${curBook.title}",
              style: TextStyle(color: Color(0XFF1A002D)))),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                width: double.infinity,
                child: Stack(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Stack(children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              _showdialogoptionsCam(context);
                            },
                            child: (isUpdating && curBook.image == null) ||
                                    isUpdating
                                ? Center(
                                    child: curBook.image == null ||
                                            curBook.image == ''
                                        ? CircleAvatar(
                                            radius: 100,
                                            backgroundImage: AssetImage(
                                                "assets/images/book.png"),

                                            /*CustomFormImage(
                                            img: AssetImage(
                                                "assets/images/book.png")*/
                                          )
                                        : CircleAvatar(
                                            radius: 100,
                                            backgroundImage: FileImage(
                                              File(curBook.image),
                                            ) /*CustomFormImage(
                                            img:
                                                FileImage(File(curBook.image)*/
                                            ))
                                : Center(
                                    child: _image == null
                                        ? CircleAvatar(
                                            radius: 100,
                                            backgroundColor: Colors.grey[100],
                                          )
                                        /*CustomFormImage(
                                            img: AssetImage(
                                                "assets/images/book.png"))*/
                                        : CircleAvatar(
                                            radius: 100,
                                            backgroundImage: FileImage(_image),
                                          ) /*CustomFormImage(
                                            img: FileImage(_image))*/
                                    ),
                          ),
                          Positioned(
                            left: 150,
                            top: 20,
                            bottom: 30,
                            child: _image == null && !isUpdating
                                ? IconButton(
                                    icon: Icon(Icons.add_a_photo,
                                        size: 70, color: Colors.grey[700]),
                                    onPressed: () {
                                      _showdialogoptionsCam(context);
                                    },
                                  )
                                : Text(''),
                          ),
                        ]),
                      ],
                    ),
                  ],
                )),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  //color: Colors.white,

                  ),
              child: Padding(
                padding:
                    const EdgeInsets.only(right: 10.0, left: 10.0, top: 15),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        controller: titleController,
                        validator: (val) =>
                            val.length == 0 ? 'Digite o título' : null,
                        onSaved: (val) => title = val,
                        style: TextStyle(color: iconColor),
                        decoration: InputDecoration(
                            isDense: true,
                            prefixIcon: Icon(Icons.text_format,
                                size: 30, color: iconColor),
                            border: OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide.none,
                              //borderSide: const BorderSide(),
                            ),
                            hintStyle: TextStyle(
                              color: iconColor,
                            ),
                            filled: true,
                            fillColor: fillColor,
                            hintText: 'Título'),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        controller: authorController,
                        validator: (val) =>
                            val.length == 0 ? 'Digite o nome do autor' : null,
                        onSaved: (val) => author = val,
                        style: TextStyle(color: iconColor),
                        decoration: InputDecoration(
                            isDense: true,
                            prefixIcon: Icon(Icons.account_circle,
                                size: 30, color: iconColor),
                            border: OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide.none,
                              //borderSide: const BorderSide(),
                            ),
                            hintStyle: TextStyle(
                              color: iconColor,
                            ),
                            filled: true,
                            fillColor: fillColor,
                            hintText: 'Autor'),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        controller: genreController,
                        validator: (val) =>
                            val.length == 0 ? 'Digite o género' : null,
                        onSaved: (val) => genre = val,
                        style: TextStyle(color: iconColor),
                        decoration: InputDecoration(
                            isDense: true,
                            prefixIcon:
                                Icon(Icons.receipt, size: 30, color: iconColor),
                            border: OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide.none,
                              //borderSide: const BorderSide(),
                            ),
                            hintStyle: TextStyle(
                              color: iconColor,
                            ),
                            filled: true,
                            fillColor: fillColor,
                            hintText: 'Género'),
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Flexible(
                            child: TextFormField(
                              controller: pagesController,
                              validator: (val) => val.length == 0
                                  ? 'Digite o número de páginas'
                                  : null,
                              onSaved: (val) => pages = int.parse(val),
                              keyboardType: TextInputType.number,
                              style: TextStyle(color: iconColor),
                              decoration: InputDecoration(
                                  isDense: true,
                                  prefixIcon: Icon(Icons.import_contacts,
                                      size: 30, color: iconColor),
                                  border: OutlineInputBorder(
                                    // width: 0.0 produces a thin "hairline" border
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10.0),
                                        topLeft: Radius.circular(10.0)),
                                    borderSide: BorderSide.none,
                                    //borderSide: const BorderSide(),
                                  ),
                                  hintStyle: TextStyle(
                                    color: iconColor,
                                  ),
                                  filled: true,
                                  fillColor: fillColor,
                                  hintText: 'Páginas'),
                            ),
                          ),
                          Flexible(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: priceController,
                              validator: (val) => val.length == 0
                                  ? 'Digite o preço do livro'
                                  : null,
                              onSaved: (val) => price = double.parse(val),
                              style: TextStyle(color: iconColor),
                              decoration: InputDecoration(
                                  isDense: true,
                                  prefixIcon: Icon(Icons.attach_money,
                                      size: 30, color: iconColor),
                                  border: OutlineInputBorder(
                                    // width: 0.0 produces a thin "hairline" border
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(10.0),
                                        topRight: Radius.circular(10.0)),
                                    borderSide: BorderSide.none,
                                    //borderSide: const BorderSide(),
                                  ),
                                  hintStyle: TextStyle(
                                    color: iconColor,
                                  ),
                                  filled: true,
                                  fillColor: fillColor,
                                  hintText: 'Preço'),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Flexible(
                        child: TextFormField(
                          controller: publishingController,
                          validator: (val) => val.length == 0
                              ? 'Digite o nome da editora'
                              : null,
                          onSaved: (val) => publishing = val,
                          style: TextStyle(color: iconColor),
                          decoration: InputDecoration(
                              isDense: true,
                              prefixIcon:
                                  Icon(Icons.book, size: 30, color: iconColor),
                              border: OutlineInputBorder(
                                // width: 0.0 produces a thin "hairline" border
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide.none,
                                //borderSide: const BorderSide(),
                              ),
                              hintStyle: TextStyle(
                                color: iconColor,
                              ),
                              filled: true,
                              fillColor: fillColor,
                              hintText: 'Editora'),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        controller: descriptionController,
                        onSaved: (val) => description = val,
                        keyboardType: TextInputType.multiline,
                        minLines: 1, //Normal textInputField will be displayed
                        maxLines: 5, //

                        style: TextStyle(color: iconColor),
                        decoration: InputDecoration(
                            isDense: true,
                            prefixIcon:
                                Icon(Icons.info, size: 30, color: iconColor),
                            border: OutlineInputBorder(
                              // width: 0.0 produces a thin "hairline" border
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide.none,
                              //borderSide: const BorderSide(),
                            ),
                            hintStyle: TextStyle(
                              color: iconColor,
                            ),
                            filled: true,
                            fillColor: fillColor,
                            hintText: 'Descrição'),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: RaisedButton(
                          padding: EdgeInsets.only(
                              top: 15, bottom: 15, left: 20, right: 20),
                          color: Color(0XFF2B8896),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          elevation: 0.0,
                          onPressed: validate,
                          child: Text(
                            isUpdating ? 'Actualizar' : 'Adicionar',
                            style: TextStyle(fontSize: 17, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<bool> _showdialogoptionsCam(context) {
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
                title: Text(''),
                /* Row(
                  children: <Widget>[
                    Icon(Icons.add_a_photo, color: Color(0XFF2B8896), size: 30),
                    SizedBox(width: 10),
                    Text('Opções'),
                    Divider(
                      color: Colors.grey,
                      height: 8.0,
                    )
                  ],
                )*/
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
                            getImageCam();
                            Navigator.of(context).pop();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Icon(Icons.camera_alt, color: Color(0XFFEB852E)),
                              SizedBox(width: 10),
                              Text('Camera',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey[700]))
                            ],
                          )),
                      FlatButton(
                          onPressed: () {
                            getImageGallery();
                            Navigator.of(context).pop();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Icon(Icons.photo_library,
                                  color: Color(0XFFEA5840)),
                              SizedBox(width: 10),
                              Text('Galeria',
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

  /*void _showdialoginfo() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Row(children: [
              Icon(
                Icons.info_outline,
                color: Color(0XFFEA5840),
                size: 30,
              ),
              SizedBox(width: 10),
              Text('Informação',
                  style: TextStyle(fontSize: 18.0, color: Color(0XFF1A002D))),
            ]),
            content: isUpdating
                ? Text('O Livro Foi Actualizado Com Sucesso')
                : Text('O Livro Foi Adicionado Com Sucesso'),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/home');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.check_circle,
                        color: Color(0XFF2B8896),
                        size: 30,
                      ),
                      SizedBox(width: 10),
                      Text('Ok',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700]))
                    ],
                  )),
            ],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          );
        });
  }*/

  Future<bool> showDialogue({
    desmissible = true,
    @required subtitle,
  }) {
    return showDialog(
        context: context,
        barrierDismissible: desmissible,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListBody(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                              child: CircularProgressIndicator(
                            backgroundColor: Colors.orange,
                          )),
                          SizedBox(height: 10.0),
                          Container(
                            child: Text(
                              "$subtitle",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87),
                            ),
                          ),
                          SizedBox(height: 10)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
