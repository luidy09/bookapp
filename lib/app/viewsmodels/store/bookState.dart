import 'package:bookapp/app/models/books.dart';

import 'package:mobx/mobx.dart';

part 'bookState.g.dart';

class BookState = _BookState with _$BookState;

abstract class _BookState with Store {
  @observable
  String title;
  @observable
  String author;
  @observable
  int pages;
  @observable
  int reads;
  @observable
  int lastRead;
  @observable
  double price;
  @observable
  int paragraph;
  @observable
  String genre;
  @observable
  String publishing;
  @observable
  String description;
  @observable
  int favorite;
  @observable
  int classification;
  @observable
  String dataCriacao;
  @observable
  String image;
  @observable
  int id;
  @observable
  int percent;
  @observable
  int total;
  @observable
  int lendo;
  @observable
  int terminados;

  @observable
  bool isLoading = false;

  @observable
  bool isSearching = false;

  @action
  void loading(load) {
    isLoading = load;
  }

  @action
  void setSearching(bool state) {
    isSearching = state;
  }

  @action
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
    id = livro.idlivro;
  }

  @action
  void setFavorite(favorite) {
    this.favorite = favorite;
  }

  void setLastRead(value) {
    lastRead = value;
  }

  void setPercent() {
    percent = ((lastRead * 100) ~/ pages).toInt();
  }

  void setParagraph(value) {
    paragraph = value;
  }

  @action
  void setTotal(value) {
    total = value;
  }

  @action
  void setLendo(value) {
    lendo = value;
  }

  @action
  void setTerminado(value) {
    terminados = value;
  }
}
