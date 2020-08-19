class BookToShow {
  int pkLivro;
  String titulo;
  String autor;
  String genero;
  int paginas;
  double preco;
  String publicacao;
  String descricao;
  String imagem;
  String fkUsuario;

  BookToShow(
      {this.pkLivro,
      this.titulo,
      this.autor,
      this.genero,
      this.paginas,
      this.preco,
      this.publicacao,
      this.descricao,
      this.imagem,
      this.fkUsuario});

  BookToShow.fromJson(Map<String, dynamic> json) {
    pkLivro = json['pkLivro'] ?? "";
    titulo = json['titulo'] ?? "";
    autor = json['autor'] ?? "";
    genero = json['genero'] ?? "";
    paginas = json['paginas'] ?? "";
    preco = json['preço'] ?? 0.0;
    publicacao = json['publicacao'] ?? "";
    descricao = json['descricao'] ?? "";
    imagem = json['imagem'] ?? "";
    fkUsuario = json['fkUsuario'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pkLivro'] = pkLivro;
    data['titulo'] = titulo;
    data['autor'] = autor;
    data['genero'] = genero;
    data['paginas'] = paginas;
    data['preco'] = preco;
    data['publicacao'] = publicacao;
    data['descricao'] = descricao;
    data['imagem'] = imagem;
    data['fkUsuario'] = fkUsuario;
    return data;
  }

  static List<BookToShow> fromJsonList(List<dynamic> json) => (json == null)
      ? null
      : json.map((item) => BookToShow.fromJson(item)).toList();
}
