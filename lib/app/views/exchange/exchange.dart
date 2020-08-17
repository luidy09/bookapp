import 'package:bookapp/app/components/customsearch_exchange.dart';
import 'package:bookapp/app/utils/constants.dart';
import 'package:bookapp/app/utils/size_config.dart';
import 'package:bookapp/app/views/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Exchange extends StatefulWidget {
  @override
  _ExchangeState createState() => _ExchangeState();
}

class _ExchangeState extends State<Exchange> {
  PageController _pageController = PageController(
    initialPage: 0,
  );

  bool isActiveButton = true;

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
                  Container(
                    child: Column(
                      children: [
                        Container(
                            child: Row(
                          children: [Text("Crepsculo"), Text("há 3 dias ")],
                        )),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/book_landscape.jpg"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      color: Colors.amber, child: Center(child: Text("Page1"))),
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
