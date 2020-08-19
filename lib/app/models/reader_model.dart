class Reader {
  int pkLeitor;
  String nome;
  String bi;
  String endereco;
  String telefone;
  String email;
  String senha;

  Reader(
      {this.pkLeitor,
      this.nome,
      this.bi,
      this.endereco,
      this.telefone,
      this.email,
      this.senha});

  Reader.fromJson(Map<String, dynamic> json) {
    pkLeitor = json['pkLeitor'] ?? "";
    nome = json['nome'] ?? "";
    bi = json['bi'] ?? "";
    endereco = json['endereco'] ?? "";
    telefone = json['telefone'] ?? "";
    email = json['email'] ?? "";
    senha = json['senha'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pkLeitor'] = pkLeitor;
    data['nome'] = nome;
    data['bi'] = bi;
    data['endereco'] = endereco;
    data['telefone'] = telefone;
    data['email'] = email;
    data['senha'] = senha;
    return data;
  }

  static List<Reader> fromJsonList(List<dynamic> json) => (json == null)
      ? null
      : json.map((item) => Reader.fromJson(item)).toList();
}
