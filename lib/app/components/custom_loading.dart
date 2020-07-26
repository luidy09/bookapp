import 'package:flutter/material.dart';

class CustomLoading extends StatefulWidget {
  final imgSize, height, margin;
  CustomLoading({this.height, this.imgSize, this.margin, key})
      : super(key: key);

  @override
  _CustomLoadingState createState() => _CustomLoadingState();
}

class _CustomLoadingState extends State<CustomLoading> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.height,
        margin: EdgeInsets.only(top: widget.height * .2),
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                width: widget.imgSize,
                height: widget.imgSize,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/readbook.png"))),
              ),
              Container(
                  height: widget.imgSize * .2,
                  width: widget.imgSize * .2,
                  child: CircularProgressIndicator()),
            ],
          ),
        ));
  }
}
