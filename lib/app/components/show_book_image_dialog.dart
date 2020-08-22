import 'package:bookapp/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowBookImageDialog {
  static Future<bool> show(context, image, title) {
    return showGeneralDialog(
        context: context,
        barrierDismissible: true,
        pageBuilder: (context, animation1, animation2) {
          return;
        },
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        transitionBuilder: (context, a1, a2, widget) {
          final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
          return Transform(
            transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
            child: Center(
              child: Opacity(
                opacity: a1.value,
                child: Container(
                    width: MediaQuery.of(context).size.width - 50,
                    height: 430,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: simpleBackgroundContainerColor,
                    ),
                    child: Material(
                      borderRadius: BorderRadius.circular(8),
                      color: simpleBackgroundContainerColor,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Center(
                          child: SingleChildScrollView(
                            child: Container(
                              height: 380,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 4,
                                      blurRadius: 6,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                  image: DecorationImage(
                                      image: AssetImage("$image"),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        ),
                      ),
                    )),
              ),
            ),
          );
        });
  }
}
