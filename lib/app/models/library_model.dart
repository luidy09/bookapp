import 'package:bookapp/app/models/user_model.dart';

class LibraryModel {
  int pkLivraria;
  String nif;
  UserModel user;

  LibraryModel({this.pkLivraria, this.nif, this.user});

  LibraryModel.fromJson(Map<String, dynamic> json) {
    pkLivraria = json['pkLivraria'] ?? 0;
    nif = json['nif'] ?? "";
    user = UserModel.fromJson(json);
  }

  Map<String, dynamic> toJson() => {
        'pkLivraria': pkLivraria ?? 0,
        'nome': user.nome,
        'nif': nif,
        'endereco': user.endereco,
        'email': user.email,
        'telefone1': user.telefone,
        'telefone2': user.telefone1,
        'senha': user.senha,
      };

  static List<LibraryModel> fromJsonList(List<dynamic> json) => (json == null)
      ? null
      : json.map((item) => LibraryModel.fromJson(item)).toList();
}
