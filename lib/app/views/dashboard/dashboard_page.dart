import 'package:bookapp/app/models/books.dart';
import 'package:bookapp/app/services/sql/db_helper.dart';
import 'package:bookapp/app/viewsmodels/store/bookState.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final bookState = BookState();
  DBHelper dbHelper;
  Future<List<Book>> books;

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
  }

  @override
  Widget build(BuildContext context) {
    Future<int> qntL = dbHelper.getQuant();
    Future<int> qntLL = dbHelper.getLivrosLidos();

    return Scaffold(
      appBar: AppBar(
        title: Text('Estatística'),
        centerTitle: true,
        backgroundColor: Color(0XFF1A002D),
        elevation: 0.0,
      ),
      body: FutureBuilder(
        future: Future.wait(
            [qntL, qntLL]), // a previously-obtained Future<String> or null
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            //Retornado
            int qnttotal = snapshot.data[0];
            int qntlidos =
                (qnttotal != 0) ? (snapshot.data[1] * 100) ~/ qnttotal : 0;
            int qntnl = (qntlidos != 0) ? 100 - qntlidos : 0;

            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(
                            top: 0, bottom: 90, right: 32, left: 32),
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
                              SizedBox(height: 50),
                              Center(
                                child: Column(
                                  children: <Widget>[
                                    Stack(children: <Widget>[
                                      SizedBox(
                                        height: 250.0,
                                        width: 250.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              new AlwaysStoppedAnimation<Color>(
                                                  Color(0XFFEB852E)),
                                          value: 1,
                                          strokeWidth: 8,
                                          backgroundColor: Color(0XFF3C0068),
                                        ),
                                      ),
                                      Positioned(
                                        left: 25,
                                        top: 25,
                                        child: SizedBox(
                                          height: 200.0,
                                          width: 200.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                new AlwaysStoppedAnimation<
                                                    Color>(Color(0XFFEA5840)),
                                            value: qntlidos / 100,
                                            strokeWidth: 8,
                                            backgroundColor: Color(0XFF3C0068),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 50,
                                        top: 50,
                                        child: SizedBox(
                                          height: 150.0,
                                          width: 150.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Color(0XFF2B8896)),
                                            value: qntnl / 100,
                                            strokeWidth: 8,
                                            backgroundColor: Color(0XFF3C0068),
                                          ),
                                        ),
                                      ),
                                    ]),
                                  ],
                                ),
                              ),
                            ]),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Painel Controle',
                          style: TextStyle(
                              color: Color(0XFF1A002D),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(height: 2),
                  Card(
                    shadowColor: Color(0XFF1A002D),
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, top: 20, bottom: 10),
                      child: Column(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundColor: Color(0XFFEB852E),
                                    maxRadius: 8.0,
                                  ),
                                  SizedBox(width: 10),
                                  Text('Total de Livros - ',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                    '$qnttotal',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundColor: Color(0XFFEA5840),
                                    maxRadius: 8.0,
                                  ),
                                  SizedBox(width: 10),
                                  Text('Livros Lidos - ',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                    '$qntlidos%',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundColor: Color(0XFF2B8896),
                                    maxRadius: 8.0,
                                  ),
                                  SizedBox(width: 10),
                                  Text('Livros Não Lidos - ',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                    '$qntnl%',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          } else if (snapshot.hasError) {
            //Erro

            return Center(child: Text("Erro ao obter dados do livro"));
          } else {
            //AGUARDADNDO
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
