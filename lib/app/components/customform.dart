import 'package:bookapp/app/models/books.dart';
import 'package:bookapp/app/services/sql/db_helper.dart';
import 'package:flutter/material.dart';

class ContainerForm extends StatefulWidget {
  @override
  _ContainerFormState createState() => _ContainerFormState();
}

class _ContainerFormState extends State<ContainerForm> {
  void _showdialoginfo() {
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
            content: Text('O Livro Foi Adicionado Com Sucesso'),
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
  }

  bool isUpdating;
  Future<List<Book>> books;
  TextEditingController titleController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  TextEditingController genreController = TextEditingController();
  TextEditingController pagesController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController publishingController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int curUserId;
  var dbHelper;

  String title;
  String author;
  String genre;
  int pages;
  int reads;
  int lastRead;
  double price;
  String publishing;
  int paragraph;
  String description;
  int favorite;

  String image;

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    refreshList();
  }

  refreshList() {
    setState(() {
      books = dbHelper.getBooks();
    });
  }

  clearName() {
    titleController.text = '';
    authorController.text = '';
    genreController.text = '';
    pagesController.text = '';
    publishingController.text = '';
    priceController.text = '';
    descriptionController.text = '';
  }

  validate() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      /*  if (isUpdating) {
        Book e = Book(curUserId, title, author, genre, pages, reads, lastRead,
            price, publishing, paragraph, description, favorite, image);
        dbHelper.updateBook(e);
        setState(() {
          isUpdating = false;
        });
      } else {*/

      Book e = Book(
          idlivro: null,
          title: title,
          author: author,
          genre: genre,
          pages: pages,
          reads: 0,
          lastRead: 0,
          price: price,
          publishing: publishing,
          paragraph: 0,
          description: description,
          favorite: 0,
          image: image);
      print(title);
      dbHelper.saveBook(e);
      _showdialoginfo();
    }
    clearName();
    refreshList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80.0),
      child: Container(
        width: double.infinity,
        height: 500,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
            topLeft: Radius.circular(50),
          ),
          border: Border.all(),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 18.0, left: 18.0, top: 18),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: titleController,
                  validator: (val) =>
                      val.length == 0 ? 'Digite o título' : null,
                  onSaved: (val) => title = val,
                  decoration: const InputDecoration(
                      hintText: 'Título',
                      hintStyle: TextStyle(fontSize: 18),
                      prefixIcon: Icon(Icons.text_format,
                          size: 30, color: Color(0XFFEA5840))),
                ),
                TextFormField(
                  controller: authorController,
                  validator: (val) =>
                      val.length == 0 ? 'Digite o nome do autor' : null,
                  onSaved: (val) => author = val,
                  decoration: const InputDecoration(
                      hintText: 'Autor',
                      hintStyle: TextStyle(fontSize: 18),
                      prefixIcon: Icon(Icons.account_circle,
                          size: 30, color: Color(0XFFEA5840))),
                ),
                TextFormField(
                  controller: genreController,
                  validator: (val) =>
                      val.length == 0 ? 'Digite o género' : null,
                  onSaved: (val) => genre = val,
                  decoration: const InputDecoration(
                      hintText: 'Género',
                      hintStyle: TextStyle(fontSize: 18),
                      prefixIcon: Icon(Icons.receipt,
                          size: 30, color: Color(0XFFEA5840))),
                ),
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
                        decoration: const InputDecoration(
                            hintText: 'Páginas',
                            hintStyle: TextStyle(fontSize: 18),
                            prefixIcon: Icon(Icons.import_contacts,
                                size: 30, color: Color(0XFFEA5840))),
                      ),
                    ),
                    Flexible(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: priceController,
                        validator: (val) =>
                            val.length == 0 ? 'Digite o preço do livro' : null,
                        onSaved: (val) => price = double.parse(val),
                        decoration: const InputDecoration(
                            hintText: 'Preço',
                            hintStyle: TextStyle(fontSize: 18),
                            prefixIcon: Icon(Icons.attach_money,
                                size: 30, color: Color(0XFFEA5840))),
                      ),
                    ),
                  ],
                ),
                Flexible(
                  child: TextFormField(
                    controller: publishingController,
                    validator: (val) =>
                        val.length == 0 ? 'Digite o nome da editora' : null,
                    onSaved: (val) => publishing = val,
                    decoration: const InputDecoration(
                        hintText: 'Editora',
                        hintStyle: TextStyle(fontSize: 18),
                        prefixIcon: Icon(Icons.book,
                            size: 30, color: Color(0XFFEA5840))),
                  ),
                ),
                TextFormField(
                  controller: descriptionController,
                  validator: (val) =>
                      val.length == 0 ? 'Digite o nome da editora' : null,
                  onSaved: (val) => description = val,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                      hintText: 'Descrição',
                      hintStyle: TextStyle(fontSize: 18),
                      prefixIcon:
                          Icon(Icons.info, size: 30, color: Color(0XFFEA5840))),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: ButtonTheme(
                    height: 60,
                    minWidth: 180,
                    buttonColor: Color(0XFF2B8896),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      elevation: 0.0,
                      onPressed: validate,
                      child: Text(
                        'Adicionar',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
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
