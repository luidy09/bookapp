import 'package:bookapp/app/components/book_detail_card.dart';
import 'package:bookapp/app/components/custom_fab_bottom_navigation.dart';
import 'package:bookapp/app/components/customsearch.dart';
import 'package:bookapp/app/components/customtabview.dart';
import 'package:bookapp/app/utils/constants.dart';
import 'package:bookapp/app/utils/size_config.dart';
import 'package:bookapp/app/views/form/form_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: () {
              print("User Profile");
            },
            child: Container(
              padding: const EdgeInsets.all(10.0),
              height: 10,
              child: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage("assets/images/users/n4Ngwvi7.jpg"),
              ),
            ),
          ),
          elevation: 0.0,
          iconTheme: new IconThemeData(color: Color(0XFF1A002D)),
          actions: [
            IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  Navigator.pushNamed(context, 'settings');
                })
          ],
        ),
        body: Container(
          width: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: (SizeConfig.isMall) ? 120.0 : 200.0,
                          height: (SizeConfig.isMall) ? 70.0 : 100.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/logo02.png'),
                                fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(height: SizeConfig.isMall ? 10 : 20),
                        CustomSearch(),
                      ]),
                ),
                SizedBox(
                  height: (SizeConfig.isMall) ? 10.0 : 15.0,
                ),
                Observer(
                    builder: (_) =>
                        !bookState.isSearching ? CustomTabView() : Container()),
                SizedBox(
                  height: (SizeConfig.isMall) ? 5.0 : 10.0,
                ),
              ]),
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
        bottomNavigationBar: CustomFABBottomNavigation(
          activeNumber: 0,
        ));
  }
}
