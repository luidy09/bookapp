import 'package:bookapp/app/utils/size_config.dart';
import 'package:flutter/material.dart';

class CustomSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        elevation: 2.0,
        child: Container(
            height: (SizeConfig.isMall) ? 35.0 : 50.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25), color: Colors.white),
            child: TextField(
              keyboardType: TextInputType.text,
              autofocus: false,
              enableInteractiveSelection: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search,
                    size: (SizeConfig.isMall) ? 20 : 30,
                    color: Color(0XFFEB852E)),
                hintText: 'Pesquisar',
                hintStyle: TextStyle(),
                border: InputBorder.none,
              ),
            )),
      ),
    );
  }
}
