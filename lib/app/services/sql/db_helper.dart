import 'dart:async';
import 'dart:io' as io;
import 'package:bookapp/app/models/books.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper {
  static Database _db;
  /*static  const String idlivro;
 static  const String title;
 static  const String author;
 static  const String genre;
 static  const String pages;
 static  const String reads;
 static const  String lastRead;
 static const  String price;
 static const  String publishing;
 static  const String paragraph;
 static  const String description;
 static  const String favorite;*/

  static const String TABLE = 'books';
  static const String DB_NAME = 'testl.db';

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE  livro (idlivro INTEGER PRIMARY KEY, title TEXT, author TEXT,genre TEXT,pages INTEGER,reads INTEGER,lastRead INTEGER,price DOUBLE,publishing TEXT,paragraph INTEGER,description TEXT,favorite INTEGER,image TEXT)");
  }

  //DB LIVRO OPERATIONS

  List<String> atributosLivro = [
    "idlivro",
    "title",
    "author",
    "pages",
    "reads",
    "lastRead",
    "price",
    "paragraph",
    "genre",
    "publishing",
    "description",
    "favorite",
    "image"
  ];

  Future<Book> saveBook(Book livro) async {
    var dbClient = await db;
    var id = await dbClient.insert("livro", livro.toMap());

    Book book = await getBook(id);

    return book;

    /*
    await dbClient.transaction((txn) async {
      var query = "INSERT INTO $TABLE ($NAME) VALUES ('" + employee.name + "')";
      return await txn.rawInsert(query);
    });
    */
  }

  Future<int> updateBook(Book livro) async {
    var dbClient = await db;
    return await dbClient.update("livro", livro.toMap(),
        where: 'idlivro = ?', whereArgs: [livro.idlivro]);
  }

  Future<List<Book>> getBooks() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query("livro",
        columns: atributosLivro, orderBy: "idlivro DESC ");
    //List<Map> maps = await dbClient.rawQuery("SELECT * FROM $TABLE");
    List<Book> livros = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        livros.add(Book.fromMap(maps[i]));
      }
    }
    return livros;
  }

  Future<List<String>> genres() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query("livro",
        columns: ["genre"], distinct: true, orderBy: "genre ASC ");
    //List<Map> maps = await dbClient.rawQuery("SELECT * FROM $TABLE");
    List<String> genres = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        genres.add(maps[i]["genre"]);
      }
    }
    return genres;
  }

  /*Future<List<Book>> recentBooks() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query("livro",
        columns: atributosLivro, orderBy: "data_criacao DESC ");
    //List<Map> maps = await dbClient.rawQuery("SELECT * FROM $TABLE");
    List<Book> livros = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        livros.add(Book.fromMap(maps[i]));
      }
    }
    return livros;
  }*/

  Future<int> getLastInsertedBook() async {
    var valor;
    var dbClient = await db;
    List<Map> maps =
        await dbClient.rawQuery("SELECT max(idlivro) as id from livro");

    for (int i = 0; i < maps.length; i++) {
      valor = maps[i]["id"];
    }
    return valor;
  }

  Future<List<Book>> getEspecificBook(String where) async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query("livro",
        columns: atributosLivro, where: where, orderBy: "idlivro DESC ");
    //List<Map> maps = await dbClient.rawQuery("SELECT * FROM $TABLE");
    List<Book> livros = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        livros.add(Book.fromMap(maps[i]));
      }
    }
    return livros;
  }

  Future<Book> getBook(int id) async {
    var dbClient = await db;
    List<Map> maps =
        await dbClient.rawQuery("SELECT *  FROM  livro  WHERE idlivro = $id");

    Book livro;
    if (maps.length > 0) {
      livro = Book.fromMap(maps[0]);
    }

    return livro;
  }

  Future<int> deleteBook(int id) async {
    var dbClient = await db;
    return await dbClient
        .delete("livro", where: 'idlivro = ?', whereArgs: [id]);
  }

  Future<int> setFavoriteBook(id, favorita) async {
    favorita = (favorita == 0) ? 0 : 1;

    var dbClient = await db;
    return await dbClient.update("livro", {"favorite": favorita},
        where: 'idlivro = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> increase(id, atributo) async {
    print("INCREASE");
    var dbClient = await db;
    return await dbClient.rawQuery(
        "UPDATE livro SET $atributo =  $atributo + 1 where idlivro = $id ");
  }

  Future<List<Map<String, dynamic>>> decrease(id, atributo) async {
    var dbClient = await db;
    return await dbClient.rawQuery(
        "UPDATE livro SET $atributo =  $atributo - 1 where idlivro = $id ");
  }

  Future<List<Map<String, dynamic>>> updateAttr(id, atributo, value) async {
    var dbClient = await db;
    return await dbClient
        .rawQuery("UPDATE livro SET $atributo =  $value where idlivro = $id ");
  }

  Future<int> getQuant({String where = "1=1"}) async {
    var dbClient = await db;

    List<Map> maps = await dbClient.query("livro",
        columns: ["count(*) as quantidade"], where: where);
    int quantidade;
    if (maps.length > 0) {
      quantidade = maps[0]["quantidade"];
    }
    print(quantidade);

    return quantidade;
  }

  Future<int> getLivrosLidos() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query("livro",
        columns: ["count(*) as quanLidos"], where: "lastRead=pages");
    int quantLidos;
    if (maps.length > 0) {
      quantLidos = maps[0]["quanLidos"];
    }

    return quantLidos;
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
