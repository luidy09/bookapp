class UserModel {
  String nome;
  String endereco;
  String telefone;
  String telefone1;
  String email;
  String senha;
  String imagem;

  UserModel.fromJson(Map<String, dynamic> json) {
    nome = json['name'] ?? "";
    endereco = json['address'] ?? "";
    telefone = json['phone'] ?? "";
    telefone1 = json['altphone'] ?? "";
    email = json['email'] ?? "";
    senha = json['password'] ?? "";
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
