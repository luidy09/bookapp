class Livraria {
  int pkLivraria;
  String nome;
  String nif;
  String endereco;
  String email;
  String telefone1;
  String telefone2;
  String senha;

  Livraria(
      {this.pkLivraria,
      this.nome,
      this.nif,
      this.endereco,
      this.email,
      this.telefone1,
      this.telefone2,
      this.senha});

  Livraria.fromJson(Map<String, dynamic> json) {
    pkLivraria = json['pkLivraria'] ?? "";
    nome = json['nome'] ?? "";
    nif = json['nif'];
    endereco = json['endereco'] ?? "";
    email = json['email'] ?? "";
    telefone1 = json['telefone1'] ?? "";
    telefone2 = json['telefone2'] ?? "";
    senha = json['senha'] ?? "";
  }

  factory Livraria.fromMap(Map<String, dynamic> map) => Livraria.fromJson(map);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pkLivraria'] = pkLivraria;
    data['nome'] = nome;
    data['nif'] = nif;
    data['endereco'] = endereco;
    data['email'] = email;
    data['telefone1'] = telefone1;
    data['telefone2'] = telefone2;
    data['senha'] = this.senha;
    return data;
  }

  static List<Livraria> fromJsonList(List<dynamic> json) => (json == null)
      ? null
      : json.map((item) => Livraria.fromJson(item)).toList();
}
