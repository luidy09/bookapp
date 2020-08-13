import 'package:bookapp/app/utils/constants.dart';
import 'package:bookapp/app/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomCarrosselPage extends StatelessWidget {
  final pageController, imgPath, title, message, btnText;
  final bool goHome;

  CustomCarrosselPage(
      {this.pageController,
      this.imgPath,
      this.title,
      this.message,
      this.btnText,
      this.goHome});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Center(
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Container(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SafeArea(
                    child: Container(
                      width: SizeConfig.isMall ? 200 : 300,
                      height: SizeConfig.isMall ? 200 : 300,
                      child: CircleAvatar(
                        child: Image.asset(imgPath, fit: BoxFit.contain),
                        backgroundColor: Color(0xfff5f5f5),
                        radius: 100.0,
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.isMall ? 25.0 : 45.0),
                  Container(
                    child: Text(
                      "$title",
                      style: TextStyle(
                          fontSize: (SizeConfig.isMall) ? 12 : 16,
                          color: Color(0XFFEB852E),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      child: SafeArea(
                        child: Text(
                          "$message",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          style: TextStyle(
                              fontSize: (SizeConfig.isMall) ? 12 : 16,
                              color: Color(0XFF1A002D)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.isMall ? 35.0 : 50),
                  Center(
                    child: SmoothPageIndicator(
                        controller: pageController,
                        count: 2,
                        effect: ExpandingDotsEffect(
                          activeDotColor: Color(0XFF1A002D),
                          dotHeight: SizeConfig.isMall ? 5.0 : 10.0,
                        )),
                  ),
                  SizedBox(height: SizeConfig.isMall ? 35 : 30),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Align(
                            alignment: FractionalOffset.bottomCenter,
                            child: FlatButton(
                              splashColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: intenseGray,
                                      width: SizeConfig.isMall ? 0.5 : 1,
                                      style: BorderStyle.solid),
                                  borderRadius: BorderRadius.circular(50)),
                              onPressed: () {
                                if (!goHome) {
                                  pageController.jumpToPage(1);
                                } else {
                                  Navigator.popAndPushNamed(context, '/home');
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                child: Text(
                                  "$btnText",
                                  style: TextStyle(
                                      fontSize: SizeConfig.isMall ? 12 : 18,
                                      color: Color(0xFF1A002D),
                                      fontFamily: 'Montserrat'),
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeConfig.isMall ? 10 : 15),
                ]),
          ),
        ),
      ),
    );
  }
}
