import 'package:bookapp/app/components/customsearch_exchange.dart';
import 'package:bookapp/app/utils/size_config.dart';
import 'package:bookapp/app/views/exchange/exchange_card.dart';
import 'package:bookapp/app/views/home/home_page.dart';
import 'package:flutter/material.dart';

class Exchange extends StatefulWidget {
  @override
  _ExchangeState createState() => _ExchangeState();
}

class _ExchangeState extends State<Exchange> {
  PageController _pageController = PageController(
    initialPage: 0,
  );

  bool isActiveButton = true;

  List<Widget> exchanges = [
    ExchangeCard(
      id: 1,
      username: "Pedro Pombal Viegas",
      email: "pedropombalviegas@gmail.com",
      phone1: "222 333 345",
      phone2: "923 454 567",
      address: "Luanda, Rua Amilcar Cabral , N 123",
      title: "Crepúsculo II",
      timeago: "há 3 dias",
      exchangeImage: "assets/images/book_landscape.jpg",
      author: "Jane Austen",
      genre: "Romance",
      userImage: "assets/images/users/n4Ngwvi7.jpg",
    ),
    ExchangeCard(
      id: 2,
      username: "Aime Muteba",
      email: "aimemuteba@gmail.com",
      phone1: "222 333 345",
      phone2: "923 454 567",
      address: "Luanda, Rua Amilcar Cabral , N 123",
      title: "50 Tons de Cinzas",
      timeago: "17 fev 2020",
      exchangeImage: "assets/images/landbook.jpg",
      author: "Christian Grey",
      genre: "Romance",
      userImage: "assets/images/users/NTIxMTkuanBn.jpg",
    ),
    ExchangeCard(
      id: 3,
      username: "Luidy da Silva ",
      email: "luidysilva@gmail.com",
      phone1: "222 444 378",
      phone2: "925 254 367",
      address: "Luanda,Rangel  Rua Simão Abreu, N 123",
      title: "A arte da guerra",
      timeago: "há 2 horas",
      exchangeImage: "assets/images/landbook1.jpg",
      author: "Sun Tzu",
      genre: "Estrategia",
      userImage: "assets/images/users/MzYyNTIuanBn.jpg",
    ),
  ];

  List<Widget> myexchanges = [
    ExchangeCard(
      id: 3,
      username: "Jelson Neto",
      email: "jelsonneto@gmail.com",
      phone1: "222 444 378",
      phone2: "925 254 367",
      address: "Luanda,Rangel  Rua Simão Abreu, N 123",
      title: "Lueji",
      timeago: "há 2 horas",
      exchangeImage: "assets/images/pepetela.jpg",
      author: "Pepetela",
      genre: "Estrategia",
      userImage: "assets/images/users/photo-1521587765099-8835e7201186.jpeg",
    ),
    ExchangeCard(
      id: 1,
      username: "Jacob Silvano Pessela",
      email: "jacobpessela@gmail.com",
      phone1: "222 333 345",
      phone2: "923 454 567",
      address: "Luanda, Rua Amilcar Cabral , N 123",
      title: "Foco ",
      timeago: "há 5 dias",
      exchangeImage: "assets/images/landbook4.jpeg",
      author: "Daniel Goleman",
      genre: "Romance",
      userImage: "assets/images/users/LgPx_hOQ.jpg",
    ),
    ExchangeCard(
      id: 2,
      username: "Diocleciano Gonga",
      email: "dioclecianogonga@gmail.com",
      phone1: "222 333 345",
      phone2: "923 454 567",
      address: "Luanda, Rua Amilcar Cabral , N 123",
      title: "Cosmos",
      timeago: "há 4 horas",
      exchangeImage: "assets/images/landbook2.jpg",
      author: "Carl Sagan",
      genre: "Romance",
      userImage: "assets/images/users/KtCFjlD4.jpg",
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  changeActive(index) {
    setState(() {
      isActiveButton = (isActiveButton) ? false : true;
    });

    //_pageController.jumpTo(index);

    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.linear,
    );

    print("IS ACTIVE VALUE : $isActiveButton");
  }

  changePage(page) {
    setState(() {
      isActiveButton = (page == 0) ? true : false;
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
        title: Text("Troca de livros", style: TextStyle(color: Colors.black)),
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color(0XFF1A002D)),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext contetx) => HomePage()));
            }),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 5),
              child: CustomSearchExchange(),
            ),
            SizedBox(height: 20),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9)),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    color: (isActiveButton)
                        ? Color(0xff00BC96)
                        : Color(0xffE0F7F2),
                    onPressed: () {
                      if (!isActiveButton) changeActive(0);
                    },
                    child: Text("Disponível",
                        style: (isActiveButton)
                            ? TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)
                            : TextStyle(
                                fontSize: 16, color: Color(0xff9C9C9C))),
                  ),
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9)),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    color: (!isActiveButton)
                        ? Color(0xff00BC96)
                        : Color(0xffE0F7F2),
                    onPressed: () {
                      if (isActiveButton) changeActive(1);
                    },
                    child: Text("Meus Livros",
                        style: (!isActiveButton)
                            ? TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)
                            : TextStyle(
                                fontSize: 16, color: Color(0xff9C9C9C))),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
                child: Expanded(
              child: PageView(
                onPageChanged: (int page) {
                  print("PAGE IS $page");
                  changePage(page);
                },
                scrollDirection: Axis.horizontal,
                controller: _pageController,
                children: [
                  ListView.builder(
                      itemCount: exchanges.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return exchanges[index];
                      }),
                  ListView.builder(
                      itemCount: myexchanges.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return myexchanges[index];
                      }),
                ],
              ),
            ))
          ],
        ),
      ),
    );
    ;
  }
}
