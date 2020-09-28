import 'package:bookapp/app/models/api_response_model.dart';
import 'package:bookapp/app/models/books.dart';
import 'package:bookapp/app/services/network_requests/book_service.dart';
import 'package:bookapp/app/services/shared_local_storage_service.dart';
import 'package:bookapp/app/utils/constants.dart';
import 'package:bookapp/app/utils/functions/helper_functions.dart';
import 'package:bookapp/app/utils/size_config.dart';
import 'package:bookapp/app/views/library_user/library_book_form.dart';
import 'package:bookapp/app/views/library_user/library_book_info_widget.dart';
import 'package:bookapp/app/views/sale/set_sale_book.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LibrarySelectBook extends StatefulWidget {
  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<LibrarySelectBook> {
  Future<APIResponseModel> userBooks;
  bool isSearching = false;

  TextEditingController searchController = TextEditingController();

  SharedLocalStorageServices sharedPrefs = new SharedLocalStorageServices();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _refreshList();
  }

  refreshList() {
    setState(() {
      userBooks = getBooks();
    });
  }

  Future<void> _refreshList() async {
    setState(() {
      isSearching = false;
      userBooks = getBooks();
    });
  }

  setIsSearchig(bool state) {
    setState(() {
      isSearching = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Selecionar livro",
            style: GoogleFonts.montserrat(
                textStyle: TextStyle(
              color: Color(0XFF1A002D),
            ))),
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color(0XFF1A002D)),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: (SizeConfig.isMall) ? 40.0 : 50.0,
                decoration: BoxDecoration(
                  border: Border.all(color: simpleGray, width: 0.0),
                  borderRadius: BorderRadius.circular(10),
                  color: simpleGray,
                ),
                child: TextField(
                  controller: searchController,
                  onChanged: (val) {
                    //getBooks(val.trim());

                    if (val.isNotEmpty) {
                      if (!isSearching) {
                        setIsSearchig(true);
                      }
                    } else {
                      if (isSearching) {
                        setIsSearchig(false);
                      }
                    }
                  },
                  keyboardType: TextInputType.text,
                  autofocus: false,
                  enableInteractiveSelection: true,
                  decoration: InputDecoration(
                    prefixIcon: !isSearching
                        ? Icon(Icons.search,
                            size: (SizeConfig.isMall) ? 20 : 30,
                            color: Color(0xFF19002D))
                        : InkWell(
                            onTap: () {
                              searchController.text = "";

                              setIsSearchig(false);
                            },
                            child: Icon(Icons.close,
                                size: (SizeConfig.isMall) ? 20 : 30,
                                color: Color(0xFF19002D)),
                          ),
                    hintText: 'Pesquisar',
                    hintStyle: TextStyle(),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: FutureBuilder<APIResponseModel>(
                  future:
                      userBooks, // a previously-obtained Future<String> or null
                  builder: (BuildContext context,
                      AsyncSnapshot<APIResponseModel> snapshot) {
                    if (snapshot.hasData) {
                      //Retornado

                      APIResponseModel response = snapshot.data;

                      if (response.code == "201") {
                        List<Book> bookList = Book.fromJsonList(response.data);

                        if (bookList.length == 0) {
                          Text(
                            "Ainda não registrou livros",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          );
                        }

                        return list(bookList);
                      } else {
                        return Center(
                          child: Text("Não foi possível obter os livros"),
                        );
                      }
                    } else if (snapshot.hasError) {
                      //Erro
                      return Center(
                        child: Text("Não foi possível obter os livros"),
                      );
                    } else {
                      //AGUARDADNDO
                      return Center(
                        child: Container(
                          height: 45,
                          width: 45,
                          child: CircularProgressIndicator(
                            backgroundColor: mainColorGreen,
                            strokeWidth: 5,
                          ),
                        ),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: mainColorGreen,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => LibraryBookForm(
                    isUpdating: false,
                  )));
        },
      ),
    );
  }

  Widget list(List<Book> list) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: list.length,
      shrinkWrap: true,
      itemBuilder: (_, index) {
        Book book = list[index];

        return InkWell(
          onTap: () {
            print("ID ${book.idlivro}");
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => SetSaleBook()));
          },
          child: LibraryBookInfoWidget(
            author: book.author,
            title: book.title,
            genre: book.genre,
            publishing: book.publishing,
            bookImage: "assets/images/3596.jpg",
          ),
        );
      },
    );
  }
}
