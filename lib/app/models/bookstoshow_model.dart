class BookToShowModel {
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

  BookToShowModel(
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

  BookToShowModel.fromJson(Map<String, dynamic> json) {
    pkLivro = json['pkLivro'] ?? 0;
    titulo = json['titulo'] ?? "";
    autor = json['autor'] ?? "";
    genero = json['genero'] ?? "";
    paginas = json['paginas'] ?? 0;
    preco = json['preco'] ?? 0.0;
    publicacao = json['publicacao'] ?? "";
    descricao = json['descricao'] ?? "";
    imagem = json['imagem'] ?? "";
    fkUsuario = json['fkUsuario'] ?? "";
  }

  Map<String, dynamic> toJson() => {
        'pkLivro': pkLivro,
        'titulo': titulo,
        'autor': autor,
        'genero': genero,
        'paginas': paginas,
        'preco': preco,
        'publicacao': publicacao,
        'descricao': descricao,
        'imagem': imagem,
        'fkUsuario': fkUsuario,
      };

  static List<BookToShowModel> fromJsonList(List<dynamic> json) =>
      (json == null)
          ? null
          : json.map((item) => BookToShowModel.fromJson(item)).toList();
}
