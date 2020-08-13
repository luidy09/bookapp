import 'package:bookapp/app/components/custom_carrossel_page.dart';
import 'package:flutter/material.dart';

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
          CustomCarrosselPage(
            pageController: pageController,
            imgPath: 'assets/images/readbook.png',
            title: 'Jada Pinkett Smith',
            message:
                'Às vezes ser fiel a si mesmo significa usar um fato de Batman em vez de um smoking (terno).',
            btnText: 'Continuar',
            goHome: false,
          ),
          CustomCarrosselPage(
            pageController: pageController,
            imgPath: 'assets/images/book.png',
            title: 'A Arte Da Guerra',
            message:
                'Se ignoras teu inimigo e conheces a ti mesmo, tuas chances de perder e de ganhar serão idênticas .',
            btnText: 'Começar',
            goHome: true,
          )
        ],
      ),
    );
  }
}
