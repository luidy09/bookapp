import 'package:bookapp/app/components/custom_fab_bottom_navigation.dart';
import 'package:bookapp/app/utils/constants.dart';
import 'package:bookapp/app/utils/size_config.dart';
import 'package:bookapp/app/views/home/home_page.dart';
import 'package:bookapp/app/views/sale/selling_book_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sale extends StatefulWidget {
  @override
  _SaleState createState() => _SaleState();
}

class _SaleState extends State<Sale> {
  bool isSearchingSellingBook = false;

  TextEditingController searchController = TextEditingController();

  List<Widget> sellingBooks = [
    SellingBookCard(
      author: "Dárdano Santos",
      bookImage: "assets/images/landbook3.jpg",
      genre: "Motivacional",
      price: "1700,00 AOA",
      sellingId: 1,
      timeago: "há 1 dia",
      title: "A Arte de Seguir Alguém ",
      userImage: "assets/images/users/photo-1463453091185-61582044d556.jpeg",
      address: "Luanda, Rua Amilcar Cabral , N 123",
      email: "lelo@gmail.com",
      phone1: "222 333 345",
      phone2: "923 454 567",
      username: "Pedro Pombal Viegas ",
    ),
    SellingBookCard(
      author: "Dárdano Santos",
      bookImage: "assets/images/landbook4.jpeg",
      genre: "Motivacional",
      price: "1700,00 AOA",
      sellingId: 2,
      timeago: "há 1 dia",
      title: "A Arte de Seguir Alguém ",
      userImage: "assets/images/users/photo-1463453091185-61582044d556.jpeg",
      address: "Luanda, Rua Amilcar Cabral , N 123",
      email: "lelo@gmail.com",
      phone1: "222 333 345",
      phone2: "923 454 567",
      username: "Livraria Lelo",
    ),
    SellingBookCard(
      author: "Dárdano Santos",
      bookImage: "assets/images/landbook1.jpg",
      genre: "Motivacional",
      price: "1700,00 AOA",
      sellingId: 3,
      timeago: "há 1 dia",
      title: "A Arte de Seguir Alguém ",
      userImage: "assets/images/users/photo-1463453091185-61582044d556.jpeg",
      address: "Luanda, Rua Amilcar Cabral , N 123",
      email: "lelo@gmail.com",
      phone1: "222 333 345",
      phone2: "923 454 567",
      username: "Livraria Lelo",
    ),
    SellingBookCard(
      author: "Pepetela",
      bookImage: "assets/images/pepetela.jpg",
      genre: "Contos",
      price: "4 500,00 AOA",
      sellingId: 1,
      timeago: "há 4 dias",
      title: "Lueji ",
      userImage: "assets/images/users/photo-1463453091185-61582044d556.jpeg",
      address: "Luanda, Rua Amilcar Cabral , N 123",
      email: "lelo@gmail.com",
      phone1: "222 333 345",
      phone2: "923 454 567",
      username: "Livraria Lelo",
    ),
  ];

  List<Widget> sellingBooksSearch = [
    SellingBookCard(
      author: "Pepetela",
      bookImage: "assets/images/pepetela.jpg",
      genre: "Contos",
      price: "4 500,00 AOA",
      sellingId: 1,
      timeago: "há 4 dias",
      title: "Lueji ",
      userImage: "assets/images/users/photo-1463453091185-61582044d556.jpeg",
      address: "Luanda, Rua Amilcar Cabral , N 123",
      email: "lelo@gmail.com",
      phone1: "222 333 345",
      phone2: "923 454 567",
      username: "Livraria Lelo",
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
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext contetx) => HomePage()));
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
        onPressed: () {},
      ),
      bottomNavigationBar: CustomFABBottomNavigation(
        activeNumber: 3,
      ),
    );
  }
}
