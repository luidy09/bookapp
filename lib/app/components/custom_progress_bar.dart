import 'package:bookapp/app/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomProgressBar extends StatelessWidget {
  final percent, height, size;
  CustomProgressBar({this.percent, @required this.height, this.size});

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      minHeight: 6,
      backgroundColor: simpleGray,
      valueColor: AlwaysStoppedAnimation<Color>(getProgressColor(percent)),
      value: (percent / 100),
    );
  }
}
