import 'package:bookapp/app/views/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text('Definições',
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
    body: ListView(
      children: [
        
       
                Padding(
                  padding: const EdgeInsets.only(right: 30.0, left: 20),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.pushNamed(context, '/dashboard');
                      });
                    },
                    child: ListTile(
                      leading: Icon(Icons.trending_up,
                          size: 30, color: Color(0XFFEA5840)),
                      title: Text(
                        'Estátistica',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                            ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30.0, left: 20.0),
                  child: Divider(color: Colors.grey[850]),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30.0, left: 20),
                  child: InkWell(
                    child: ListTile(
                      leading: Icon(Icons.lightbulb_outline,
                          size: 30, color: Color(0XFF2B8896)),
                      title: Text(
                        'Modo Escuro (Inactivo)',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                            ),
                      ),
                      // trailing: CustomSwitch(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30.0, left: 20.0),
                  child: Divider(color: Colors.grey[850]),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30.0, left: 20),
                  child: InkWell(
                    child: ListTile(
                      leading: Icon(Icons.info_outline,
                          size: 30, color: Color(0XFFEB852E)),
                      title: Text(
                        'Sobre',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                           ),
                      ),
                    ),
                  ),
                ),
                  Padding(
                  padding: const EdgeInsets.only(right: 30.0, left: 20.0),
                  child: Divider(color: Colors.grey[850]),
                ),
                   Padding(
                  padding: const EdgeInsets.only(right: 30.0, left: 20),
                  child: InkWell(
                    onTap: () {
                      final RenderBox box = context.findRenderObject();
                      Share.share(
                          "BookApp, a melhor aplicação de gestão de livros do mercado angolano, baixe já.",
                          sharePositionOrigin:
                              box.localToGlobal(Offset.zero) & box.size);
                    },
                    child: ListTile(
                      leading:
                          Icon(Icons.share, size: 30, color: Color(0XFFEB852E)),
                      title: Text(
                        'Partilhar',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),
                      ),
                    ),
                  ),
                ),
      ],

    ),
    
    
    
    );
  }
}
