import 'package:flutter/foundation.dart';

class Book extends ChangeNotifier {
  int idlivro;
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

  Book(
      {this.idlivro,
      this.title,
      this.author,
      this.genre,
      this.pages,
      this.reads,
      this.lastRead,
      this.price,
      this.publishing,
      this.paragraph,
      this.description,
      this.favorite,
      this.image});

  setLivro(Book livro) {
    title = livro.title;

    author = livro.author;
    pages = livro.pages;
    reads = livro.reads;
    lastRead = livro.lastRead;
    price = livro.price;
    paragraph = livro.paragraph;
    genre = livro.genre;
    publishing = livro.publishing;
    description = livro.description;
    favorite = livro.favorite;
    image = livro.image;
    idlivro = livro.idlivro;
    print("SETTED");

    notifyListeners();
  }

  void setFavorite(favorite) {
    this.favorite = favorite;

    notifyListeners();
  }

  void setLastRead(value) {
    lastRead = value;

    notifyListeners();
  }

  /*void setPercent() {
    percent = ((lastRead * 100) ~/ pages).toInt();
  }*/

  void setParagraph(value) {
    paragraph = value;
    notifyListeners();
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'idlivro': idlivro,
      'title': title ?? "",
      'author': author ?? "",
      'genre': genre ?? "",
      'pages': pages ?? 0,
      'reads': reads ?? 0,
      'lastRead': lastRead ?? 0,
      'price': price ?? 0.0,
      'publishing': publishing ?? "",
      'paragraph': paragraph ?? 0,
      'description': description ?? "",
      'favorite': favorite ?? 0,
      'image': image ?? "",
    };
    return map;
  }

  Book.fromMap(Map<String, dynamic> map) {
    idlivro = map['idlivro'];

    title = map['title'];
    author = map['author'];
    genre = map['genre'];

    pages = map['pages'];

    reads = map['reads'];
    lastRead = map['lastRead'];

    price = map['price'];
    publishing = map['publishing'];
    paragraph = map['paragraph'];
    description = map['description'];
    favorite = map['favorite'];
    image = map['image'];
  }
}
