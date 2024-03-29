import 'package:bookapp/app/views/form/form_page.dart';
import 'package:flutter/material.dart';
//import 'package:bookapp/app/components/customswitch.dart';
import 'package:share/share.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      child: Drawer(
        child: Container(
          color: Colors.white,
          child: Center(
            child: ListView(
              children: <Widget>[
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.only(right: 30.0, left: 10),
                  child: Container(), //Image.asset(''),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(right: 30.0, left: 20),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => FormPage(
                                isUpdating: false,
                              )));
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.add_circle_outline,
                        size: 30,
                        color: Color(0XFFEB852E),
                      ),
                      title: Text(
                        '',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 30.0, left: 20.0),
                    child: Divider(color: Colors.grey[850]),
                  ),
                ),
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
                        '',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 30.0, left: 20.0),
                    child: Divider(color: Colors.grey[850]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30.0, left: 20),
                  child: InkWell(
                    child: ListTile(
                      leading: Icon(Icons.lightbulb_outline,
                          size: 30, color: Color(0XFF2B8896)),
                      title: Text(
                        '',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            ),
                      ),
                      // trailing: CustomSwitch(),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 30.0, left: 20.0),
                    child: Divider(color: Colors.grey[850]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30.0, left: 20),
                  child: InkWell(
                    child: ListTile(
                      leading: Icon(Icons.info_outline,
                          size: 30, color: Color(0XFFEB852E)),
                      title: Text(
                        '',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                           ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 30.0, left: 20.0),
                    child: Divider(color: Colors.grey[850]),
                  ),
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
                        '',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.only(right: 30.0, left: 20),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: ListTile(
                      leading: Icon(Icons.highlight_off,
                          size: 30, color: Colors.grey),
                      title: Text(
                        '',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
