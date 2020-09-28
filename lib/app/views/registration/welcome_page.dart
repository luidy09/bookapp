import 'package:bookapp/app/utils/constants.dart';
import 'package:bookapp/app/utils/size_config.dart';
import 'package:bookapp/app/views/library_user/library_profile_owner.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  final userId, userType;

  WelcomePage({@required this.userId, @required this.userType});

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Text("Seja Bem Vindo ao BookApp"),
                  SizedBox(height: 20),
                  Text("Tudo pronto para começar"),
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage("assets/images/registering1.png"))),
                  ),
                  SizedBox(height: 50),
                  FlatButton(
                    splashColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: intenseGray,
                            width: SizeConfig.isMall ? 0.5 : 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(50)),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              LibraryProfileOwner(
                                  idLibrary: widget.userId,
                                  userType: widget.userType)));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Text(
                        "Começar",
                        style: TextStyle(
                          fontSize: SizeConfig.isMall ? 12 : 18,
                          color: Color(0xFF1A002D),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
