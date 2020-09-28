import 'package:bookapp/app/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomFABBottomNavigationLibrary extends StatefulWidget {
  final activeNumber;
  final bool isEndFAB;
  final userType;
  final isFirst;

  CustomFABBottomNavigationLibrary(
      {this.isFirst = false,
      this.userType,
      this.activeNumber,
      this.isEndFAB = false});

  @override
  _CustomFABBottomNavigationLibraryState createState() =>
      _CustomFABBottomNavigationLibraryState();
}

class _CustomFABBottomNavigationLibraryState
    extends State<CustomFABBottomNavigationLibrary> {
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
              Navigator.of(context).pushNamed('/sale_available');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.collections,
              color:
                  (widget.activeNumber == 4) ? mainColorRed : mainColorDarkBlue,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/publication_available');
            },
          ),
          SizedBox(width: 20)
          //widget.isEndFAB ? SizedBox(width: 20) : Text("")
        ],
      ),
    );
  }
}

class CustomFABBottomNavigationLibraryCenter extends StatefulWidget {
  final activeNumber;

  CustomFABBottomNavigationLibraryCenter({this.activeNumber});

  @override
  _CustomFABBottomNavigationLibraryCenterState createState() =>
      _CustomFABBottomNavigationLibraryCenterState();
}

class _CustomFABBottomNavigationLibraryCenterState
    extends State<CustomFABBottomNavigationLibraryCenter> {
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

class CustomFABBottomNavigationLibraryPub extends StatefulWidget {
  final activeNumber;

  CustomFABBottomNavigationLibraryPub({this.activeNumber});

  @override
  _CustomFABBottomNavigationLibraryPubState createState() =>
      _CustomFABBottomNavigationLibraryPubState();
}

class _CustomFABBottomNavigationLibraryPubState
    extends State<CustomFABBottomNavigationLibraryPub> {
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
