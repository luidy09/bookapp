import 'package:bookapp/app/models/bookstoshow_model.dart';
import 'package:bookapp/app/models/user_model.dart';

class SellingBookModel {
  int pkLivrosVenda;
  int fkLivro;
  String nomeLivro;
  int fkUsuario;
  String usuario;
  double preco;
  BookToShowModel bookToshow;
  UserModel user;

  SellingBookModel(
      {this.pkLivrosVenda,
      this.fkLivro,
      this.nomeLivro,
      this.fkUsuario,
      this.usuario,
      this.preco});

  Map<String, dynamic> toJson() => {
        'pkLivrosVenda': pkLivrosVenda,
        'fkLivro': fkLivro,
        'nomeLivro': nomeLivro,
        'fkUsuario': fkUsuario,
        'usuario': usuario,
        'preco': preco,
      };

  SellingBookModel.fromJson(Map<String, dynamic> json) {
    pkLivrosVenda = json['pkLivrosVenda'] ?? "";
    fkLivro = json['fkLivro'] ?? "";
    nomeLivro = json['nomeLivro'] ?? "";
    fkUsuario = json['fkUsuario'] ?? "";
    usuario = json['usuario'] ?? "";
    preco = json['preco'] ?? 0.0;
    user = UserModel.fromJson(json);
    bookToshow = BookToShowModel.fromJson(json);
  }

  static List<SellingBookModel> fromJsonList(List<dynamic> json) =>
      (json == null)
          ? null
          : json.map((item) => SellingBookModel.fromJson(item)).toList();
}
