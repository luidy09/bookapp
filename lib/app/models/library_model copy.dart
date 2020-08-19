import 'package:bookapp/app/models/user_model.dart';

class LibraryModel {
  int pkLivraria;
  String nif;
  UserModel user;

  LibraryModel({this.pkLivraria, this.nif, this.user});

  LibraryModel.fromJson(Map<String, dynamic> json) {
    pkLivraria = json['pkLivraria'] ?? "";
    nif = json['nif'] ?? "";
    user = UserModel.fromJson(json);
  }

  Map<String, dynamic> toJson() => {
        'pkLivraria': pkLivraria,
        'nif': nif,
        'nome': user.nome,
        'endereco': user.endereco,
        'telefone': user.telefone,
        'telefone1': user.telefone1,
        'email': user.email,
        'senha': user.senha,
      };

  static List<LibraryModel> fromJsonList(List<dynamic> json) => (json == null)
      ? null
      : json.map((item) => LibraryModel.fromJson(item)).toList();
}
