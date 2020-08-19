import 'package:bookapp/app/models/user_model.dart';

class Reader {
  int pkLeitor;
  String bi;
  UserModel user;

  Reader({this.pkLeitor, this.bi, this.user});

  Reader.fromJson(Map<String, dynamic> json) {
    pkLeitor = json['pkLeitor'] ?? "";
    bi = json['bi'] ?? "";
    user = UserModel.fromJson(json);
  }

  Map<String, dynamic> toJson() => {
        'pkLeitor': pkLeitor,
        'bi': bi,
        'nome': user.nome,
        'endereco': user.endereco,
        'telefone': user.telefone,
        'telefone1': user.telefone1,
        'email': user.email,
        'senha': user.senha,
      };

  static List<Reader> fromJsonList(List<dynamic> json) => (json == null)
      ? null
      : json.map((item) => Reader.fromJson(item)).toList();
}
