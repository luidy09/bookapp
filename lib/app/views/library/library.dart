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
      username: "Livraria Lelo",
      userImage: "assets/images/libraries/lelo.jpg",
      address: "R. Rainha Ginga 47, Luanda",
      email: "livrarialelo@gmail.com",
      phone1: "923 606 881",
      phone2: "",
    ),
    LibraryCard(
      idLibrary: 2,
      username: "Livraria Barquinho",
      userImage: "assets/images/libraries/barquinho2.jpg",
      address: "Travessa Comandante Gika Avenida, Luanda, Angola",
      email: "barquinho@josened.com",
      phone1: "940 136 398",
      phone2: "",
    ),
    LibraryCard(
      idLibrary: 3,
      username: "Livraria Irmãs Paulinas",
      userImage: "assets/images/libraries/manaspaulinas.jpg",
      address: "R. da Liberdade 120, Luanda",
      email: "paulinaslivraria@netcabo.co.ao",
      phone1: "930 048 976",
      phone2: "",
    ),
    LibraryCard(
      idLibrary: 4,
      username: "Livraria Germinante",
      userImage: "assets/images/libraries/germinante.jpg",
      address: "",
      email: "livrariagerminante@gmail.com",
      phone1: "921474337",
      phone2: "",
    ),
    LibraryCard(
      idLibrary: 5,
      username: "Livraria Kayala",
      userImage: "assets/images/libraries/kayala.jpg",
      address: "Sambizanga Ngola Kiluanje, Luanda, Angola",
      email: "livrariakayala@gmail.com",
      phone1: "924 033 634",
      phone2: "923 971 628",
    ),
    LibraryCard(
      idLibrary: 6,
      username: "Livraria Heberilton",
      userImage: "assets/images/libraries/heberilton.jpg",
      address: "Mutamba: Av. de Portugal, Prédio n°61, RC;",
      email: "",
      phone1: "939 090 074",
      phone2: "",
    ),
  ];

  List<Widget> librariesSearch = [
    LibraryCard(
      idLibrary: 3,
      username: "Livraria Irmãs Paulinas",
      userImage: "assets/images/libraries/manaspaulinas.jpg",
      address: "R. da Liberdade 120, Luanda",
      email: "paulinaslivraria@netcabo.co.ao",
      phone1: "930 048 976",
      phone2: "",
    ),
  ];

  getLibraries(search) {
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
