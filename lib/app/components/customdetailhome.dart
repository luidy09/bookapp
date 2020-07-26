import 'package:bookapp/app/components/customsearch.dart';
import 'package:flutter/material.dart';

class CustomDetailHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 10, bottom: 20, right: 32, left: 32),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
          color: Color(0XFF1A002D)),
      child: Column(children: <Widget>[
         Padding(
           padding: const EdgeInsets.only(left:60.0, right: 60.0),
           child: Image.asset('assets/images/logo_03.png'),
         ),
        CustomSearch(),
      ]),
    );
  }
}
