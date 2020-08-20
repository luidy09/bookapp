import 'package:bookapp/app/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomFABBottomNavigation extends StatefulWidget {
  final activeNumber;
  final bool isEndFAB;

  CustomFABBottomNavigation({this.activeNumber, this.isEndFAB = false});

  @override
  _CustomFABBottomNavigationState createState() =>
      _CustomFABBottomNavigationState();
}

class _CustomFABBottomNavigationState extends State<CustomFABBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      //color: bottomNaviagtionColor,
      child: new Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.import_contacts,
              color:
                  (widget.activeNumber == 1) ? mainColorRed : mainColorDarkBlue,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/library');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.compare_arrows,
              color:
                  (widget.activeNumber == 2) ? mainColorRed : mainColorDarkBlue,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/exchange');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_basket,
              color:
                  (widget.activeNumber == 3) ? mainColorRed : mainColorDarkBlue,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/sale');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.web_asset,
              color:
                  (widget.activeNumber == 4) ? mainColorRed : mainColorDarkBlue,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/publication');
            },
          ),
          SizedBox(width: 20)
          //widget.isEndFAB ? SizedBox(width: 20) : Text("")
        ],
      ),
    );
  }
}

class CustomFABBottomNavigationCenter extends StatefulWidget {
  final activeNumber;

  CustomFABBottomNavigationCenter({this.activeNumber});

  @override
  _CustomFABBottomNavigationCenterState createState() =>
      _CustomFABBottomNavigationCenterState();
}

class _CustomFABBottomNavigationCenterState
    extends State<CustomFABBottomNavigationCenter> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      //color: bottomNaviagtionColor,
      child: new Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.import_contacts,
              color:
                  (widget.activeNumber == 1) ? mainColorRed : mainColorDarkBlue,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/library');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.compare_arrows,
              color:
                  (widget.activeNumber == 2) ? mainColorRed : mainColorDarkBlue,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/exchange');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_basket,
              color:
                  (widget.activeNumber == 3) ? mainColorRed : mainColorDarkBlue,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/sale');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.collections,
              color:
                  (widget.activeNumber == 4) ? mainColorRed : mainColorDarkBlue,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/publication');
            },
          ),
        ],
      ),
    );
  }
}
