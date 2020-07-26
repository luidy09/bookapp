import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CustomCarousel extends StatefulWidget {
  @override
  _CustomCarouselState createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  List<Image> listar = new List();

  CarouselSlider instance;

  void initState() {
    super.initState();

    listar.add(Image.asset('assets/images/readbook.png'));
    listar.add(Image.asset('assets/images/book.png'));
  }

  @override
  Widget build(BuildContext context) {
    instance = new CarouselSlider(
      items: listar,
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
      ),
    );

    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 0, bottom: 20, right: 32, left: 32),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
            color: Color(0XFF1A002D)),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                child: instance,
              ),
              SizedBox(height: 50),
              Center(
                child: Column(
                  children: <Widget>[
                    Text(
                      'A Arte De Ler',
                      style: TextStyle(
                          fontSize: 30,
                          color: Color(0XFFEB852E),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'é um texto modelo da indústria tipográfica e de impressão. O Lorem Ipsum tem vindo a ser o texto padrão usado por estas indústrias desde o ano de 1500, quando uma misturou os caracteres de um texto para criar um espécime de livro. Este texto não só sobreviveu 5.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
