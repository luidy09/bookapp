import 'package:bookapp/app/components/customdrawer.dart';
import 'package:bookapp/app/components/customsearch.dart';
import 'package:bookapp/app/components/customtabview.dart';
import 'package:bookapp/app/utils/size_config.dart';
import 'package:flutter/material.dart';

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
    print(SizeConfig.isMall);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: new IconThemeData(color: Color(0XFF1A002D)),
      ),
      drawer: CustomDrawer(),
      body: Container(
        width: double.infinity,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Column(children: <Widget>[
                  Container(
                    width: (SizeConfig.isMall) ? 100.0 : 200.0,
                    height: (SizeConfig.isMall) ? 50.0 : 100.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/logo02.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  CustomSearch(),
                ]),
              ),
              SizedBox(
                height: (SizeConfig.isMall) ? 5.0 : 10.0,
              ),
              CustomTabView(),
              SizedBox(
                height: (SizeConfig.isMall) ? 5.0 : 10.0,
              ),
            ]),
      ),
    );
  }
}
