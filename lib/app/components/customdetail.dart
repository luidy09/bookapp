import 'package:flutter/material.dart';

class CustomDetail extends StatefulWidget {
  @override
  _CustomDetailState createState() => _CustomDetailState();
}

class _CustomDetailState extends State<CustomDetail> {
  void _showdialogoptions() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(children: [
            Icon(Icons.tune, color: Color(0XFF2B8896), size: 30),
            SizedBox(width: 10),
            Text(
              'Opções',
              style: TextStyle(fontSize: 18.0, color: Color(0XFF1A002D)),
            )
          ]),
          content: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                FlatButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.loop, color: Color(0XFFEB852E)),
                        SizedBox(width: 10),
                        Text('Actualizar livro',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey[700]))
                      ],
                    )),
                Divider(
                  color: Colors.grey,
                ),
                FlatButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.delete, color: Color(0XFFEA5840)),
                        SizedBox(width: 10),
                        Text('Apagar livro',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey[700]))
                      ],
                    )),
              ]),
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        );
      },
    );
  }

  void _showdialoginfo() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Row(children: [
              Icon(
                Icons.info_outline,
                color: Color(0XFFEA5840),
                size: 30,
              ),
              SizedBox(width: 10),
              Text('Informação',
                  style: TextStyle(fontSize: 18.0, color: Color(0XFF1A002D))),
            ]),
            content: Text(''),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          );
        });
  }

  void _showdialogstatisc() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Row(children: [
              Icon(Icons.trending_up, size: 30, color: Color(0XFFEB852E)),
              SizedBox(width: 10),
              Text('Desempenho de leitura',
                  style: TextStyle(fontSize: 18.0, color: Color(0XFF1A002D)))
            ]),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        height: 8,
                        width: 200,
                        child: LinearProgressIndicator(
                          value: 0.35, // percent filled
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.orange),
                          backgroundColor: Colors.grey[200],
                        ),
                      ),
                    ),
                    Text(
                      '20%',
                      style: TextStyle(fontSize: 18, color: Color(0XFFEB852E)),
                    )
                  ],
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Última Página',
                      style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: GestureDetector(
                        child: Container(
                            width: 150,
                            height: 30,
                            child: Icon(
                              Icons.add,
                              color: Color(0XFF2B8896),
                              size: 20,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(4),
                                bottomLeft: Radius.circular(4),
                              ),
                              border: Border.all(),
                            )),
                      ),
                    ),
                    Expanded(
                        child: GestureDetector(
                      child: Container(
                        width: 30,
                        height: 30,
                        child: Center(
                          child: Text(
                            '10',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0XFF2B8896)),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(),
                        ),
                      ),
                    )),
                    Expanded(
                        child: GestureDetector(
                      child: Container(
                        width: 150,
                        height: 30,
                        child: Icon(
                          Icons.remove,
                          color: Color(0XFFEA5840),
                          size: 20,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(4),
                            bottomRight: Radius.circular(4),
                          ),
                          border: Border.all(),
                        ),
                      ),
                    )),
                  ],
                ),
                SizedBox(height: 18),
                Divider(color: Colors.grey),
                SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Paragrafo       ',
                      style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: GestureDetector(
                        child: Container(
                          width: 150,
                          height: 30,
                          child: Icon(Icons.add,
                              size: 20, color: Color(0XFF2B8896)),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4),
                              bottomLeft: Radius.circular(4),
                            ),
                            border: Border.all(),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: GestureDetector(
                      child: Container(
                        width: 30,
                        height: 30,
                        child: Center(
                          child: Text(
                            '10',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0XFF2B8896)),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(),
                        ),
                      ),
                    )),
                    Expanded(
                        child: GestureDetector(
                      child: Container(
                        width: 150,
                        height: 30,
                        child: Icon(
                          Icons.remove,
                          color: Color(0XFFEA5840),
                          size: 20,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(4),
                            bottomRight: Radius.circular(4),
                          ),
                          border: Border.all(),
                        ),
                      ),
                    )),
                  ],
                ),
              ],
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 300, bottom: 20, right: 32, left: 32),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
          color: Color(0XFF1A002D)),
      child: Column(children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.trending_up, color: Color(0XFFEB852E), size: 30),
              onPressed: () {
                setState(() {
                  _showdialogstatisc();
                });
              },
              tooltip: 'Estátistica',
            ),
            IconButton(
              icon:
                  Icon(Icons.info_outline, color: Color(0XFFEA5840), size: 30),
              onPressed: () {
                setState(() {
                  _showdialoginfo();
                });
              },
              tooltip: 'Informação',
            ),
            IconButton(
              icon: Icon(Icons.tune, color: Color(0XFF2B8896), size: 30),
              onPressed: () {
                setState(() {
                  _showdialogoptions();
                });
              },
              tooltip: 'Opções',
            ),
          ],
        )
      ]),
    );
  }
}
