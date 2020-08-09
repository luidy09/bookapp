import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselPageView extends StatefulWidget {
  @override
  _CarouselPageViewState createState() => _CarouselPageViewState();
}

class _CarouselPageViewState extends State<CarouselPageView> {
  PageController pageController = PageController(initialPage: 0);
  //int _currentPage = 0;

/*  @override
void initState() {
  super.initState();
  Timer.periodic(Duration(seconds: 5), (Timer timer) {
    if (_currentPage < 2) {
      _currentPage++;
    } else {
      _currentPage = 0;
    }

    pageController.animateToPage(
      _currentPage,
      duration: Duration(milliseconds: 350),
      curve: Curves.easeIn,
    );
  });
}*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          Container(
            width: double.infinity,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Stack(children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 80.0),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 30.0, right: 30.0),
                              child: Center(
                                child: CircleAvatar(
                                  child: Image.asset(
                                      'assets/images/readbook.png',
                                      fit: BoxFit.contain),
                                  backgroundColor: Colors.grey[300],
                                  radius: 150.0,
                                ),
                              ),
                            ),
                            SizedBox(height: 45.0),
                            Center(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      'Jada Pinkett Smith',
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Color(0XFFEB852E),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                      child: Container(
                                    height: 80,
                                    child: Text(
                                      'Às vezes ser fiel a si mesmo significa usar um fato de Batman em vez de um smoking (terno) ',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Color(0XFF1A002D)),
                                    ),
                                  ))
                                ],
                              ),
                            ),
                          ]),
                    ]),
                  ),
                  SizedBox(height: 60),
                  Center(
                    child: SmoothPageIndicator(
                        controller: pageController,
                        count: 2,
                        effect: ExpandingDotsEffect(
                          activeDotColor: Color(0XFF1A002D),
                          dotHeight: 10.0,
                        )),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 20),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Align(
                                  alignment: FractionalOffset.bottomRight,
                                  child: FlatButton(
                                    onPressed: () {
                                      pageController.animateToPage(1,
                                          duration: Duration(milliseconds: 0),
                                          curve: Curves.bounceIn);
                                    },
                                    child: Text(
                                      'Pular',
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Color(0XFF1A002D),
                                          fontFamily: 'Montserrat'),
                                    ),
                                  ) /*ButtonTheme(
                            height: 60,
                          
                            minWidth: 150,
                            child: RaisedButton(
                              color: Color(0XFF1A002D),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: BorderSide(color: Color(0XFF1A002D)),
                              ),
                              onPressed: () {
                                setState(() {
                                  Navigator.popAndPushNamed(context, '/home');
                                });
                              },
                              child: Text(
                                'Iniciar',
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),*/
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ]),
          ),
          Container(
            width: double.infinity,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Stack(children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 80.0),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 30.0, right: 30.0),
                              child: Center(
                                child: CircleAvatar(
                                  child: Image.asset('assets/images/book.png',
                                      fit: BoxFit.contain),
                                  backgroundColor: Colors.grey[300],
                                  radius: 150.0,
                                ),
                              ),
                            ),
                            SizedBox(height: 45.0),
                            Center(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                      child: Text(
                                    'A Arte Da Guerra',
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Color(0XFFEB852E),
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  )),
                                  SizedBox(height: 10),
                                  Container(
                                      child: Container(
                                    height: 80,
                                    child: Text(
                                      'Se ignoras teu inimigo e conheces a ti mesmo, tuas chances de perder e de ganhar serão idênticas .',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Color(0XFF1A002D)),
                                    ),
                                  ))
                                ],
                              ),
                            ),
                          ]),
                    ]),
                  ),
                  SizedBox(height: 60),
                  Center(
                    child: SmoothPageIndicator(
                        controller: pageController,
                        count: 2,
                        effect: ExpandingDotsEffect(
                          activeDotColor: Color(0XFF1A002D),
                          dotHeight: 10.0,
                        )),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 20),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Align(
                                  alignment: FractionalOffset.bottomRight,
                                  child: FlatButton(
                                    onPressed: () {
                                      Navigator.popAndPushNamed(
                                          context, '/home');
                                    },
                                    child: Text(
                                      'Iniciar',
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Color(0XFF1A002D),
                                          fontFamily: 'Montserrat'),
                                    ),
                                  ) /*ButtonTheme(
                            height: 60,
                          
                            minWidth: 150,
                            child: RaisedButton(
                              color: Color(0XFF1A002D),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: BorderSide(color: Color(0XFF1A002D)),
                              ),
                              onPressed: () {
                                setState(() {
                                  Navigator.popAndPushNamed(context, '/home');
                                });
                              },
                              child: Text(
                                'Iniciar',
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),*/
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
