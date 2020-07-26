import 'package:bookapp/app/components/custombooklist.dart';
import 'package:bookapp/app/models/books.dart';
import 'package:bookapp/app/services/sql/db_helper.dart';
import 'package:flutter/material.dart';

class CustomTabView extends StatefulWidget {
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

    Widget tab = Tab(
      child: Text(
        "$s",
        style: TextStyle(),
      ),
    );
    listaTab.add(tab);
  }

  addView(String s) {
    Widget view = CustomBookList(genre: s);
    listaView.add(view);
  }

  fillListTab(genres) {
    clearList();
    addTab("Todos");
    genres.forEach((elem) {
      addTab(elem);
    });
  }

  fillListView(genres) {
    clearListView();
    addView("all");
    genres.forEach((elem) {
      addView(elem);
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    Align(
                      alignment: Alignment.topLeft,
                      child: TabBar(
                        isScrollable: true,
                        indicatorColor: Color(0XFFEB852E),
                        //indicatorWeight: 2,
                        labelColor: Color(0XFF1A002D),
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        unselectedLabelColor: Colors.grey,
                        tabs: listaTab,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(),
                        child: TabBarView(
                          children: listaView,
                        ),
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
