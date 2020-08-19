class UserModel {
  String nome;
  String endereco;
  String telefone;
  String telefone1;
  String email;
  String senha;
  String imagem;

  UserModel.fromJson(Map<String, dynamic> json) {
    nome = json['nome'] ?? "";
    endereco = json['endereco'] ?? "";
    telefone = json['telefone'] ?? "";
    telefone1 = json['telefone1'] ?? "";
    email = json['email'] ?? "";
    senha = json['senha'] ?? "";
    imagem = json['imagem'] ?? "";
  }

  Map<String, dynamic> toJsonAll() => {
        'nome': nome,
        'endereco': endereco,
        'telefone': telefone,
        'telefone1': telefone1,
        'email': email,
        'senha': senha
      };

  Map<String, dynamic> toJson() => {
        "phone": telefone1,
        "password": senha,
      };

  static List<UserModel> fromJsonList(List<dynamic> json) => (json == null)
      ? null
      : json.map((item) => UserModel.fromJson(item)).toList();
}
