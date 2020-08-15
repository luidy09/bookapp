import 'package:bookapp/app/models/books.dart';
import 'package:bookapp/app/services/sql/db_helper.dart';
import 'package:bookapp/app/views/home/home_page.dart';
import 'package:bookapp/app/viewsmodels/store/bookState.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        title: Text('Estatistica',
            style: GoogleFonts.montserrat(
                textStyle: TextStyle(
              color: Color(0XFF1A002D),
            ))),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color(0XFF1A002D)),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext contetx) => HomePage()));
            }),
      ),
      body: Container(
        color: Colors.white,
        child: FutureBuilder(
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
                        Column(
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
                                          backgroundColor: Colors.orange,
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
                                            backgroundColor: Colors.red[200],
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
                                            backgroundColor: Colors.green,
                                          ),
                                        ),
                                      ),
                                    ]),
                                  ],
                                ),
                              ),
                            ]),
                      ],
                    ),
                    SizedBox(height: 98),
                    /*Padding(
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
                    ),*/

                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Color(0XFFEB852E),
                                          maxRadius: 8.0,
                                        ),
                                        SizedBox(width: 10),
                                        Text('Total de Livros',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    Text(
                                      '$qnttotal',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Divider(
                                  height: 20,
                                  color: Colors.grey,
                                  thickness: 0,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Color(0XFFEA5840),
                                          maxRadius: 8.0,
                                        ),
                                        SizedBox(width: 10),
                                        Text('Livros Lidos',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    Text(
                                      '$qntlidos%',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Divider(
                                  height: 20,
                                  color: Colors.grey,
                                  thickness: 0,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Color(0XFF2B8896),
                                          maxRadius: 8.0,
                                        ),
                                        SizedBox(width: 10),
                                        Text('Livros Não Lidos',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    Text(
                                      '$qntnl%',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
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
      ),
    );
  }
}
