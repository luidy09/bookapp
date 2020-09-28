import 'package:bookapp/app/components/custom_fab_bottom_navigation_library.dart';
import 'package:bookapp/app/data/change_notifier_models/user_notifier.dart';
import 'package:bookapp/app/models/api_response_model.dart';
import 'package:bookapp/app/models/library_model.dart';
import 'package:bookapp/app/models/user_model.dart';
import 'package:bookapp/app/services/network_requests/library_service.dart';
import 'package:bookapp/app/services/shared_local_storage_service.dart';
import 'package:bookapp/app/views/form/form_page.dart';
import 'package:bookapp/app/views/library/library.dart';
import 'package:bookapp/app/views/library/library_book_selling_card.dart';
import 'package:bookapp/app/views/library/library_profile_info_card.dart';
import 'package:bookapp/app/views/library/library_publication_card.dart';
import 'package:bookapp/app/views/library_user/library_books.dart';
import 'package:bookapp/app/views/login/login.dart';
import 'package:bookapp/app/viewsmodels/store/userState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../utils/constants.dart';

class LibraryProfileOwner extends StatelessWidget {
  final idLibrary,
      username,
      userImage,
      address,
      email,
      phone1,
      phone2,
      userType;

  LibraryProfileOwner(
      {this.idLibrary,
      this.userType,
      this.userImage,
      this.username,
      this.address,
      this.email,
      this.phone1,
      this.phone2});

  final SharedLocalStorageServices sharedPrefs =
      new SharedLocalStorageServices();

  List<String> followerImages = [
    "assets/images/users/n4Ngwvi7.jpg",
    "assets/images/users/NTIxMTkuanBn.jpg",
    "assets/images/users/KtCFjlD4.jpg",
    "assets/images/users/n4Ngwvi7.jpg"
  ];

  List<Widget> books = [
    LibraryBookSellingcard(
        author: "Dárdano Santos",
        bookImage: "assets/images/booksimages/seguir.jpg",
        genre: "Motivacional",
        price: 1700.00,
        sellingId: 1,
        timeago: "há 1 dia",
        title: "A Arte de Seguir Alguém ",
        userImage: "assets/images/users/91.jpg",
        address: "Luanda , Samba , Rua Vale do tamega n 23",
        email: "lerfazbem@gmail.com",
        phone1: "996 232 545",
        phone2: "996 232 000",
        username: "Ler Faz Bem (LFB)"),
    LibraryBookSellingcard(
        author: "Dárdano Santos",
        bookImage: "assets/images/landbook4.jpeg",
        genre: "Motivacional",
        price: 1700.00,
        sellingId: 2,
        timeago: "há 1 dia",
        title: "A Arte de Seguir Alguém ",
        userImage: "assets/images/users/91.jpg",
        address: "Luanda , Samba , Rua Vale do tamega n 23",
        email: "lerfazbem@gmail.com",
        phone1: "996 232 545",
        phone2: "996 232 000",
        username: "Ler Faz Bem (LFB)"),
    LibraryBookSellingcard(
        author: "Dárdano Santos",
        bookImage: "assets/images/landbook1.jpg",
        genre: "Motivacional",
        price: 1700.00,
        sellingId: 3,
        timeago: "há 1 dia",
        title: "A Arte de Seguir Alguém ",
        userImage: "assets/images/users/91.jpg",
        address: "Luanda , Samba , Rua Vale do tamega n 23",
        email: "lerfazbem@gmail.com",
        phone1: "996 232 545",
        phone2: "996 232 000",
        username: "Ler Faz Bem (LFB)"),
    LibraryBookSellingcard(
        author: "Pepetela",
        bookImage: "assets/images/pepetela.jpg",
        genre: "Contos",
        price: 4500.00,
        sellingId: 1,
        timeago: "há 4 dias",
        title: "Lueji ",
        userImage: "assets/images/users/91.jpg",
        address: "Luanda , Samba , Rua Vale do tamega n 23",
        email: "lerfazbem@gmail.com",
        phone1: "996 232 545",
        phone2: "996 232 000",
        username: "Ler Faz Bem (LFB)"),
  ];

  List<Widget> publications = [
    LibraryPublicationCard(
        username: "Livraria Lelo",
        content:
            "Neste mes estamos em promoção visite a nossa livraria, temos livros a partir de 1000 Akz...",
        pubId: 1,
        pubImage: "assets/images/landbook1.jpg",
        timeago: "há 1 dia",
        title: "Promoção mês de Agosto",
        userImage: "assets/images/libraries/lelo.jpg",
        address: "R. Rainha Ginga 47, Luanda",
        email: "livrarialelo@gmail.com",
        phone1: "923 606 881",
        phone2: "",
        reactions: 6),
    LibraryPublicationCard(
        username: "Livraria Lelo",
        content:
            "Neste mes estamos em promoção visite a nossa livraria, temos livros a partir de 1000 Akz...",
        pubId: 1,
        pubImage: "assets/images/book_landscape.jpg",
        timeago: "há 1 dia",
        title: "Promoção mês de Agosto",
        userImage: "assets/images/users/MzYyNTIuanBn.jpg",
        address: "Luanda, Rua Amilcar Cabral , N 123",
        email: "livrarialelo@gmail.com",
        phone1: "998 930 345",
        phone2: "924 678 234",
        reactions: 6),
    LibraryPublicationCard(
        username: "Livraria Lelo",
        content:
            "Neste mes estamos em promoção visite a nossa livraria, temos livros a partir de 1000 Akz...",
        pubId: 1,
        pubImage: "assets/images/landbook.jpg",
        timeago: "há 1 dia",
        title: "Promoção mês de Agosto",
        userImage: "assets/images/users/XzAzMDE4MzAuanBn.jpg",
        address: "Luanda, Rua Amilcar Cabral , N 123",
        email: "livrarialelo@gmail.com",
        phone1: "998 930 345",
        phone2: "924 678 234",
        reactions: 6),
  ];

  logOut(context) async {
    await sharedPrefs.delete("token");
    await sharedPrefs.delete("userType");
    await sharedPrefs.delete("userID");

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => Login()),
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Observer(
            builder: (_) => Text("${userState.userModel.nome}",
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                  color: Color(0XFF1A002D),
                ))),
          ),
          centerTitle: true,
          elevation: 0.0,
          leading: InkWell(
            onTap: () {
              print("User Profile");

              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => LibraryBooks()));
            },
            child: Container(
              padding: const EdgeInsets.all(10.0),
              height: 10,
              child: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage("assets/images/book.png"),
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.grey,
              ),
              onPressed: () {
                logOut(context);
              },
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Observer(
                  builder: (_) => LibraryProfileInfoCard(
                    images: followerImages,
                    userImage: userState.userModel.avatar,
                    username: userState.userModel.nome,
                    address: userState.userModel.endereco,
                    email: userState.userModel.email,
                    phone1: userState.userModel.telefone,
                    phone2: userState.userModel.telefone1,
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  margin: EdgeInsets.only(left: 25),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                              child: Text("Livros a venda",
                                  style: sellingDescriptionText))),
                      Expanded(child: Container())
                    ],
                  ),
                ),
                SizedBox(height: 15),
                SizedBox(
                  height: 330,
                  child: ListView.builder(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: books.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return books[index];
                      }),
                ),
                SizedBox(height: 15),
                Container(
                  margin: EdgeInsets.only(left: 25),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                              child: Text("Publicações",
                                  style: sellingDescriptionText))),
                      Expanded(child: Container())
                    ],
                  ),
                ),
                SizedBox(height: 15),
                SizedBox(
                  height: 404,
                  child: ListView.builder(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: publications.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return publications[index];
                      }),
                ),
                SizedBox(height: 50),
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
                builder: (BuildContext context) => FormPage(
                      isUpdating: false,
                    )));
          },
        ),
        bottomNavigationBar: CustomFABBottomNavigationLibrary(
          activeNumber: 0,
        ));
  }
}
