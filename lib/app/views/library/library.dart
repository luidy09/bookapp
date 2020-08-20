import 'package:bookapp/app/utils/constants.dart';
import 'package:bookapp/app/utils/size_config.dart';
import 'package:bookapp/app/views/home/home_page.dart';
import 'package:bookapp/app/views/library/library_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Library extends StatefulWidget {
  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
// Future<List<library>> books;
  bool isSearchingLibrary = false;

  TextEditingController searchController = TextEditingController();

  List<Widget> libraries = [
    LibraryCard(
      idLibrary: 1,
      username: "Gente Culta",
      userImage:
          "assets/images/users/MV5BMTUxMjM1MzgxMl5BMl5BanBnXkFtZTcwNDI0NDE5NQ@@._V1_UY256_CR4,0,172,256_AL_.jpg",
      address: "Luanda, Rua Amilcar Cabral , N 123",
      email: "lelo@gmail.com",
      phone1: "222 333 345",
      phone2: " 923 454 567",
    ),
    LibraryCard(
      idLibrary: 2,
      username: "Livraria Lelo",
      userImage: "assets/images/users/a2awzVm.jpg",
      address: "Luanda, Rua Amilcar Cabral , N 123",
      email: "lelo@gmail.com",
      phone1: "222 333 345",
      phone2: " 923 454 567",
    ),
  ];

  List<Widget> librariesSearch = [
    LibraryCard(
      idLibrary: 2,
      username: "Livraria Lelo",
      userImage: "assets/images/users/a2awzVm.jpg",
      address: "Luanda, Rua Amilcar Cabral , N 123",
      email: "lelo@gmail.com",
      phone1: "222 333 345",
      phone2: " 923 454 567",
    ),
  ];

  getLibaries(search) {
    setState(() {
      //books = dbHelper.searchBook(search);
    });
  }

  setIsSearchig(bool state) {
    setState(() {
      isSearchingLibrary = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Livrarias",
            style: GoogleFonts.montserrat(
                textStyle: TextStyle(
              color: Color(0XFF1A002D),
            ))),
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color(0XFF1A002D)),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext contetx) => HomePage()));
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
                      if (!isSearchingLibrary) {
                        setIsSearchig(true);
                      }
                    } else {
                      if (isSearchingLibrary) {
                        setIsSearchig(false);
                      }
                    }
                  },
                  keyboardType: TextInputType.text,
                  autofocus: false,
                  enableInteractiveSelection: true,
                  decoration: InputDecoration(
                    prefixIcon: !isSearchingLibrary
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
              isSearchingLibrary
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: librariesSearch.length,
                        itemBuilder: (BuildContext context, index) {
                          return librariesSearch[index];
                        },
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemCount: libraries.length,
                        itemBuilder: (BuildContext context, index) {
                          return libraries[index];
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
