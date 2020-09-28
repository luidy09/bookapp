enum UserType { Reader, Library }

class UserModel {
  String nome;
  int idUsuario;
  String endereco;
  String telefone;
  String telefone1;
  String email;
  String senha;
  String avatar;
  UserType userType;
  String token;
  int status;

  UserModel(
      {this.nome,
      this.idUsuario,
      this.endereco,
      this.avatar,
      this.email,
      this.status,
      this.telefone,
      this.telefone1,
      this.userType,
      this.senha});

  UserModel.fromJson(Map<String, dynamic> json) {
    idUsuario = json['idUsuario'] ?? 0;
    nome = json['name'] ?? "";
    endereco = json['address'] ?? "";
    telefone = json['phone'] ?? "";
    telefone1 = json['altphone'] ?? "";
    email = json['email'] ?? "";
    senha = json['password'] ?? "";
    avatar = json['avatar'] ?? "";
  }

  UserModel.formJson(Map<String, dynamic> json) {
    idUsuario = json['idUsuario'] ?? 0;
    userType = (json['tipoUsuario'] == 1) ? UserType.Reader : UserType.Library;
    nome = json['nome'] ?? "";
    endereco = json['endereco'] ?? "";
    telefone = json['telefone1'] ?? "";
    telefone1 = json['telefone2'] ?? "";
    email = json['email'] ?? "";
    avatar = json['avatar'] ?? "";
  }

  UserModel.onRegistrationJson(Map<String, dynamic> json) {
    print("ID ON REGISTRATION ${json['idUsuario']}");
    idUsuario = json['idUsuario'] ?? 0;
    userType = (json['tipoUsuario'] == 1) ? UserType.Reader : UserType.Library;
    token = json['token'] ?? "";
  }

  UserModel.onLogin(Map<String, dynamic> json) {
    idUsuario = json['idUsuario'] ?? 0;
    userType = (json['tipoUsuario'] == 1) ? UserType.Reader : UserType.Library;
    status = json['tipoUsuario'] ?? 0;
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
        "telefone": telefone1,
        "senha": senha,
      };

  static List<UserModel> fromJsonList(List<dynamic> json) => (json == null)
      ? null
      : json.map((item) => UserModel.fromJson(item)).toList();
}
