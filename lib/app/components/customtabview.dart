import 'package:bookapp/app/components/custombooklist.dart';
import 'package:bookapp/app/models/books.dart';
import 'package:bookapp/app/services/sql/db_helper.dart';
import 'package:bookapp/app/utils/size_config.dart';
import 'package:flutter/material.dart';

class CustomTabView extends StatefulWidget {
  @override
  _CustomTabViewState createState() => _CustomTabViewState();
}

class _CustomTabViewState extends State<CustomTabView>
    with TickerProviderStateMixin {
  TabController _controller;
  AnimationController _animationControllerOn;
  AnimationController _animationControllerOff;

  // this will give the background color values of a button when it changes to an on state
  Animation _colorTweenBackgroundOn;
  Animation _colorTweenBackgroundOff;

  // this will give the foreground color values of a button when it changes to an on state
  Animation _colorTweenForegroundOn;
  Animation _colorTweenForegroundOff;

  int _currentIndex = 0;

  // saves the previous active tab
  int _prevControllerIndex = 0;

  // saves the value of the tab animation. For example, if one is between the 1st and the 2nd tab, this value will be 0.5
  double _aniValue = 0.0;

  // saves the previous value of the tab animation. It's used to figure the direction of the animation
  double _prevAniValue = 0.0;

  // active button's foreground color
  Color _foregroundOn = Colors.white;
  Color _foregroundOff = Colors.black;

  // active button's background color
  Color _backgroundOn = Color(0XFFdedede);
  Color _backgroundOff = Color(0XFFf5f5f5);

  // this will save the keys for each Tab in the Tab Bar, so we can retrieve their position and size for the scroll controller
  List _keys = [];

  // regist if the the button was tapped
  bool _buttonTap = false;

  // scroll controller for the TabBar
  ScrollController _scrollController = new ScrollController();

  DBHelper dbHelper;
  Book book;

  List<Widget> listaTab = [];
  List<Widget> listaView = [];

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();

    dbHelper.genres().then((value) {
      fillListTab(value);

      for (int i = 0; i < listaTab.length; i++) {
        // create a GlobalKey for each Tab
        _keys.add(new GlobalKey());
      }

      // this creates the controller with 6 tabs (in our case)
      _controller = TabController(vsync: this, length: listaTab.length);
      // this will execute the function every time there's a swipe animation
      _controller.animation.addListener(_handleTabAnimation);
      // this will execute the function every time the _controller.index value changes
      _controller.addListener(_handleTabChange);
      _animationControllerOff = AnimationController(
          vsync: this, duration: Duration(milliseconds: 75));
      // so the inactive buttons start in their "final" state (color)
      _animationControllerOff.value = 1.0;
      _colorTweenBackgroundOff =
          ColorTween(begin: _backgroundOn, end: _backgroundOff)
              .animate(_animationControllerOff);
      _colorTweenForegroundOff =
          ColorTween(begin: _foregroundOn, end: _foregroundOff)
              .animate(_animationControllerOff);

      _animationControllerOn = AnimationController(
          vsync: this, duration: Duration(milliseconds: 150));
      // so the inactive buttons start in their "final" state (color)
      _animationControllerOn.value = 1.0;
      _colorTweenBackgroundOn =
          ColorTween(begin: _backgroundOff, end: _backgroundOn)
              .animate(_animationControllerOn);
      _colorTweenForegroundOn =
          ColorTween(begin: _foregroundOff, end: _foregroundOn)
              .animate(_animationControllerOn);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String capitalize(String string) {
    if (string == null) {
      throw ArgumentError("string:$string");
    }
    if (string.isEmpty) {
      return string;
    }
    return string[0].toUpperCase() + string.substring(1);
  }

  //Limpa a lista de tabs
  clearList() {
    listaTab = [];
  }

  //Limpa a lista de  views
  clearListView() {
    listaView = [];
  }

  addTab(String s) {
    s = capitalize(s);

    Widget tab = Text(
      "$s",
      style: TextStyle(),
    );
    listaTab.add(tab);
  }

  addView(String s) {
    Widget view = CustomBookList(genre: s);
    listaView.add(view);
  }

  fillListTab(genres) {
    clearList();
    addTab("Todos");
    addTab("Favorito");
    genres.forEach((elem) {
      addTab(elem);
    });
  }

  fillListView(genres) {
    clearListView();
    addView("all");
    addView("fav");
    genres.forEach((elem) {
      addView(elem);
    });
    _controller = TabController(vsync: this, length: listaView.length);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return FutureBuilder(
        future: dbHelper.genres(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            fillListTab(snapshot.data);
            fillListView(snapshot.data);

            return DefaultTabController(
                length: listaTab.length,
                child: Expanded(
                  child: Container(
                      child: Column(children: <Widget>[
                    Container(
                        height: 49.0,
                        // this generates our tabs buttons
                        child: ListView.builder(
                            // this gives the TabBar a bounce effect when scrolling farther than it's size
                            physics: BouncingScrollPhysics(),
                            controller: _scrollController,
                            // make the list horizontal
                            scrollDirection: Axis.horizontal,
                            // number of tabs
                            itemCount: listaTab.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                  // each button's key
                                  key: _keys[index],
                                  // padding for the buttons
                                  padding: EdgeInsets.all(6.0),
                                  child: ButtonTheme(
                                      child: AnimatedBuilder(
                                    animation: _colorTweenBackgroundOn,
                                    builder: (context, child) =>
                                        FlatButton.icon(
                                      label: listaTab[index],
                                      icon: index == 0
                                          ? Icon(
                                              Icons.all_inclusive,
                                              // get the color of the icon (dependent of its state)
                                              color: _getForegroundColor(index),
                                            )
                                          : index == 1
                                              ? Icon(Icons.favorite)
                                              : Container(),
                                      // get the color of the button's background (dependent of its state)
                                      color: _getBackgroundColor(index),
                                      // make the button a rectangle with round corners
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(7.0)),
                                      onPressed: () {
                                        setState(() {
                                          _buttonTap = true;
                                          // trigger the controller to change between Tab Views
                                          _controller.animateTo(index);
                                          // set the current index
                                          _setCurrentIndex(index);
                                          // scroll to the tapped button (needed if we tap the active button and it's not on its position)
                                          _scrollTo(index);
                                        });
                                      },
                                    ),
                                  )));
                            })),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(),
                        child: TabBarView(
                          controller: _controller,
                          children: listaView,
                        ),
                      ),
                    ),
                  ])),
                ));
          }

          return Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Center(child: CircularProgressIndicator()),
          );
        });
  }

  // runs during the switching tabs animation
  _handleTabAnimation() {
    // gets the value of the animation. For example, if one is between the 1st and the 2nd tab, this value will be 0.5
    _aniValue = _controller.animation.value;

    // if the button wasn't pressed, which means the user is swiping, and the amount swipped is less than 1 (this means that we're swiping through neighbor Tab Views)
    if (!_buttonTap && ((_aniValue - _prevAniValue).abs() < 1)) {
      // set the current tab index
      _setCurrentIndex(_aniValue.round());
    }

    // save the previous Animation Value
    _prevAniValue = _aniValue;
  }

  // runs when the displayed tab changes
  _handleTabChange() {
    // if a button was tapped, change the current index
    if (_buttonTap) _setCurrentIndex(_controller.index);

    // this resets the button tap
    if ((_controller.index == _prevControllerIndex) ||
        (_controller.index == _aniValue.round())) _buttonTap = false;

    // save the previous controller index
    _prevControllerIndex = _controller.index;
  }

  _setCurrentIndex(int index) {
    // if we're actually changing the index
    if (index != _currentIndex) {
      setState(() {
        // change the index
        _currentIndex = index;
      });

      // trigger the button animation
      _triggerAnimation();
      // scroll the TabBar to the correct position (if we have a scrollable bar)
      _scrollTo(index);
    }
  }

  _triggerAnimation() {
    // reset the animations so they're ready to go
    _animationControllerOn.reset();
    _animationControllerOff.reset();

    // run the animations!
    _animationControllerOn.forward();
    _animationControllerOff.forward();
  }

  _scrollTo(int index) {
    // get the screen width. This is used to check if we have an element off screen
    double screenWidth = MediaQuery.of(context).size.width;

    // get the button we want to scroll to
    RenderBox renderBox = _keys[index].currentContext.findRenderObject();
    // get its size
    double size = renderBox.size.width;
    // and position
    double position = renderBox.localToGlobal(Offset.zero).dx;

    // this is how much the button is away from the center of the screen and how much we must scroll to get it into place
    double offset = (position + size / 2) - screenWidth / 2;

    // if the button is to the left of the middle
    if (offset < 0) {
      // get the first button
      renderBox = _keys[0].currentContext?.findRenderObject();
      // get the position of the first button of the TabBar
      position = renderBox?.localToGlobal(Offset.zero)?.dx;

      if (position != null) {
        // if the offset pulls the first button away from the left side, we limit that movement so the first button is stuck to the left side
        if (position > offset) offset = position;
      }
    } else {
      // if the button is to the right of the middle

      // get the last button
      renderBox = _keys[listaTab.length - 1].currentContext?.findRenderObject();
      // get its position
      position = renderBox?.localToGlobal(Offset.zero)?.dx;
      // and size
      size = renderBox?.size?.width;

      if (size != null) {
        // if the last button doesn't reach the right side, use it's right side as the limit of the screen for the TabBar
        if (position + size < screenWidth) screenWidth = position + size;

        // if the offset pulls the last button away from the right side limit, we reduce that movement so the last button is stuck to the right side limit
        if (position + size - offset < screenWidth) {
          offset = position + size - screenWidth;
        }
      }
    }

    // scroll the calculated ammount
    _scrollController.animateTo(offset + _scrollController.offset,
        duration: new Duration(milliseconds: 150), curve: Curves.easeInOut);
  }

  _getBackgroundColor(int index) {
    if (index == _currentIndex) {
      // if it's active button
      return _colorTweenBackgroundOn.value;
    } else if (index == _prevControllerIndex) {
      // if it's the previous active button
      return _colorTweenBackgroundOff.value;
    } else {
      // if the button is inactive
      return _backgroundOff;
    }
  }

  _getForegroundColor(int index) {
    // the same as the above
    if (index == _currentIndex) {
      return _colorTweenForegroundOn.value;
    } else if (index == _prevControllerIndex) {
      return _colorTweenForegroundOff.value;
    } else {
      return _foregroundOff;
    }
  }
}
