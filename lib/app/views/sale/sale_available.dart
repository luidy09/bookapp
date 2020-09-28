import 'package:bookapp/app/components/custom_fab_bottom_navigation_no_button.dart';
import 'package:bookapp/app/utils/constants.dart';
import 'package:bookapp/app/utils/functions/helper_functions.dart';
import 'package:bookapp/app/utils/size_config.dart';
import 'package:bookapp/app/views/home/home_page.dart';
import 'package:bookapp/app/views/library_user/library_books.dart';
import 'package:bookapp/app/views/library_user/library_select_book.dart';
import 'package:bookapp/app/views/sale/selling_book_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SaleAvailable extends StatefulWidget {
  @override
  _SaleAvailableState createState() => _SaleAvailableState();
}

class _SaleAvailableState extends State<SaleAvailable> {
  bool isSearchingSellingBook = false;

  TextEditingController searchController = TextEditingController();

  List<Widget> sellingBooks = [
    SellingBookCard(
      author: "Pepetela",
      bookImage: "assets/images/booksimages/lueji.jpg",
      genre: "Contos",
      price: 4500.00,
      sellingId: 1,
      timeago: "há 4 dias",
      title: "Lueji ",
      userImage: "assets/images/libraries/heberilton.jpg",
      address: "Mutamba: Av. de Portugal, Prédio n°61, RC",
      email: "livrariaheberilton@gmail.com",
      phone1: "939 090 074",
      phone2: "923 454 567",
      username: "Livraria Heberilton",
    ),
    SellingBookCard(
      author: "Miguel de Cervantes",
      bookImage: "assets/images/booksimages/quixote.jpg",
      genre: "Paródia",
      price: 2700.00,
      sellingId: 2,
      timeago: "há 2 dia",
      title: "Dom Quixote",
      userImage: "assets/images/libraries/kayala.jpg",
      address: "Luanda, Rua Amilcar Cabral , N 123",
      email: "livrariakayala@gmail.com",
      phone1: "924 033 634",
      phone2: "923 971 628",
      username: "Livraria Kayala",
    ),
    SellingBookCard(
      author: "Spencer Johnson",
      bookImage: "assets/images/booksimages/queijo.jpg",
      genre: "Ficção",
      price: 3700.00,
      sellingId: 3,
      timeago: "há 1 dia",
      title: "Quem Mexeu no Meu Queijo? ",
      userImage: "assets/images/libraries/barquinho2.jpg",
      address: "Travessa Comandante Gika Avenida, Luanda",
      email: "barquinho@josened.com",
      phone1: "940 136 398",
      phone2: "",
      username: "Livraria Barquinho",
    ),
  ];

  List<Widget> sellingBooksSearch = [
    SellingBookCard(
      author: "Pepetela",
      bookImage: "assets/images/booksimages/lueji.jpg",
      genre: "Contos",
      price: 4500.00,
      sellingId: 1,
      timeago: "há 4 dias",
      title: "Lueji ",
      userImage: "assets/images/libraries/heberilton.jpg",
      address: "Mutamba: Av. de Portugal, Prédio n°61, RC",
      email: "livrariaheberilton@gmail.com",
      phone1: "939 090 074",
      phone2: "923 454 567",
      username: "Livraria Heberilton",
    ),
  ];

  setIsSearchig(bool state) {
    setState(() {
      isSearchingSellingBook = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Feira do livro",
            style: GoogleFonts.montserrat(
                textStyle: TextStyle(
              color: Color(0XFF1A002D),
            ))),
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color(0XFF1A002D)),
            onPressed: () {
              getUserTypeHome(context);
            }),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10, top: 30),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Venda e compre livros na feira ..."),
              SizedBox(
                height: 20,
              ),
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
                      if (!isSearchingSellingBook) {
                        setIsSearchig(true);
                      }
                    } else {
                      if (isSearchingSellingBook) {
                        setIsSearchig(false);
                      }
                    }
                  },
                  keyboardType: TextInputType.text,
                  autofocus: false,
                  enableInteractiveSelection: true,
                  decoration: InputDecoration(
                    prefixIcon: !isSearchingSellingBook
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
              !isSearchingSellingBook
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: sellingBooks.length,
                        itemBuilder: (BuildContext context, index) {
                          return sellingBooks[index];
                        },
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemCount: sellingBooksSearch.length,
                        itemBuilder: (BuildContext context, index) {
                          return sellingBooksSearch[index];
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: mainColorGreen,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => LibrarySelectBook()));
        },
      ),
      bottomNavigationBar: CustomFABBottomNavigation(
        activeNumber: 3,
      ),
    );
  }
}
