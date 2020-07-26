import 'package:flutter/material.dart';

class CustomProgressBar extends StatelessWidget {
  final percent, height, size;
  CustomProgressBar({this.percent, @required this.height, this.size});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: height,
          decoration: BoxDecoration(
              color: Color(0xffe2e3e7),
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
        ),
        Container(
            width: 200 * (percent / 100),
            height: height,
            decoration: BoxDecoration(
                color: (percent < 30)
                    ? Colors.redAccent
                    : (percent >= 30 && percent < 50)
                        ? Colors.orange
                        : Color(0xff00bc96),
                borderRadius: BorderRadius.all(Radius.circular(20.0)))),
      ],
    );
  }
}
