class Sale {
  int pkLivrosVenda;
  int fkLivro;
  String nomeLivro;
  int fkUsuario;
  String usuario;
  double preco;

  Sale(
      {this.pkLivrosVenda,
      this.fkLivro,
      this.nomeLivro,
      this.fkUsuario,
      this.usuario,
      this.preco});

  Sale.fromJson(Map<String, dynamic> json) {
    pkLivrosVenda = json['pkLivrosVenda'] ?? "";
    fkLivro = json['fkLivro'] ?? "";
    nomeLivro = json['nomeLivro'] ?? "";
    fkUsuario = json['fkUsuario'] ?? "";
    usuario = json['usuario'] ?? "";
    preco = json['preco'] ?? 0.0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pkLivrosVenda'] = pkLivrosVenda;
    data['fkLivro'] = fkLivro;
    data['nomeLivro'] = nomeLivro;
    data['fkUsuario'] = fkUsuario;
    data['usuario'] = usuario;
    data['preco'] = preco;
    return data;
  }

  static List<Sale> fromJsonList(List<dynamic> json) =>
      (json == null) ? null : json.map((item) => Sale.fromJson(item)).toList();
}
