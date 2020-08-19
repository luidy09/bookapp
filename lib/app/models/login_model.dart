class Login {
  String telefone;
  String senha;

  Login({this.telefone, this.senha});

  Login.fromJson(Map<String, dynamic> json) {
    telefone = json['telefone'] ?? "";
    senha = json['senha']?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['telefone'] = telefone;
    data['senha'] = senha;
    return data;
  }

   static List<Login> fromJsonList(List<dynamic> json) => (json == null)
      ? null
      : json.map((item) => Login.fromJson(item)).toList();
}

