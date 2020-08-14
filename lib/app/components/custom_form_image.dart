import 'package:bookapp/app/utils/size_config.dart';
import 'package:flutter/material.dart';

class CustomFormImage extends StatefulWidget {
  final img;
  CustomFormImage({this.img, Key key}) : super(key: key);

  @override
  _CustomFormImageState createState() => _CustomFormImageState();
}

class _CustomFormImageState extends State<CustomFormImage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    var screenSize = MediaQuery.of(context).size;
    double screenHeight = screenSize.height;
    double screenWidth = screenSize.width;
    print(
        "MIN SCREEN $screenWidth  $screenHeight  ACCEPTABLE IS  S ${(SizeConfig.screenHeight * .25).round()}");

    return Container(
      height: (SizeConfig.screenWidth <= SizeConfig.minScreenWidth)
          ? (SizeConfig.screenHeight >= SizeConfig.minScreenHeight)
              ? SizeConfig.screenHeight * .25
              : SizeConfig.screenHeight * .13
          : (SizeConfig.screenHeight > SizeConfig.minScreenHeight)
              ? SizeConfig.screenHeight * .4
              : SizeConfig.screenHeight * .3,
      constraints: BoxConstraints(minHeight: 99, maxHeight: 300),
      decoration: BoxDecoration(
         
          color:Colors.white,
          image: DecorationImage(image: widget.img)),
    );
  }
}
