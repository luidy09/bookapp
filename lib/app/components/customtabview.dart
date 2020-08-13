import 'package:bookapp/app/components/custombooklist.dart';
import 'package:bookapp/app/models/books.dart';
import 'package:bookapp/app/services/sql/db_helper.dart';
import 'package:bookapp/app/utils/size_config.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:bookapp/app/utils/constants.dart';

class CustomTabView extends StatefulWidget {
  CustomTabView({Key key}) : super(key: key);
  @override
  _CustomTabViewState createState() => _CustomTabViewState();
}

class _CustomTabViewState extends State<CustomTabView> {
  DBHelper dbHelper;
  Book book;

  List<Widget> listaTab = [];
  List<Widget> listaView = [];

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();

    dbHelper.genres().then((value) {
      fillListTab(value);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  String capitalize(String string) {
    if (string == null) {
      throw ArgumentError("string:$string");
    }
    if (string.isEmpty) {
      return string;
    }
    return string[0].toUpperCase() + string.substring(1);
  }

  //Limpa a lista de tabs
  clearList() {
    listaTab = [];
  }

  //Limpa a lista de  views
  clearListView() {
    listaView = [];
  }

  addTab(String s) {
    s = capitalize(s);

    Widget tab;

    if (s == "Todos") {
      tab = Tab(
        iconMargin: EdgeInsets.only(bottom: 10, right: 20),
        icon: Icon(Icons.all_inclusive),
        text: "$s",
      );
    } else if (s == "Favorito") {
      tab = Tab(
        icon: Icon(Icons.favorite),
        text: "$s",
      );
    } else {
      tab = Tab(
        text: "$s",
      );
    }

    listaTab.add(tab);
  }

  addView(String s) {
    Widget view = CustomBookList(genre: s);
    listaView.add(view);
  }

  fillListTab(genres) {
    clearList();
    addTab("Todos");
    addTab("Favorito");
    genres.forEach((elem) {
      addTab(elem);
    });
  }

  fillListView(genres) {
    clearListView();
    addView("all");
    addView("fav");
    genres.forEach((elem) {
      addView(elem);
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return FutureBuilder(
        future: dbHelper.genres(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            fillListTab(snapshot.data);
            fillListView(snapshot.data);

            return DefaultTabController(
                length: listaTab.length,
                child: Expanded(
                  child: Container(
                      child: Column(children: <Widget>[
                    ButtonsTabBar(
                      backgroundColor: intenseGray,
                      unselectedBackgroundColor: simpleGray,
                      unselectedLabelStyle: TextStyle(color: Colors.black),
                      labelStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      tabs: listaTab,
                    ),
                    SizedBox(height: SizeConfig.isMall ? 5.0 : 10),
                    Expanded(
                      child: TabBarView(
                        children: listaView,
                      ),
                    ),
                  ])),
                ));
          }

          return Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Center(child: CircularProgressIndicator()),
          );
        });
  }
}
