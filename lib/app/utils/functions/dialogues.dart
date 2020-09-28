import 'package:bookapp/app/utils/constants.dart';
import 'package:flutter/material.dart';

Future<bool> registerErrorDialogue({
  hasError = false,
  isProcessing = false,
  isWarning: false,
  message,
  @required context,
}) {
  return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
          child: Container(
            color: Colors.transparent,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 2.0, left: 5.0, right: 5.0),
                child: ListBody(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topRight,
                      child: IconButton(
                          icon: Icon(
                            Icons.close,
                            size: 25,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                            child: Icon(
                          Icons.error,
                          size: 60,
                          color: (isWarning) ? Colors.grey : Colors.red,
                        )),
                        SizedBox(height: 20),
                        Container(
                          child: Text(
                            "$message",
                            style: dialogErrorStyle,
                          ),
                        ),
                        SizedBox(height: 30)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      });
}

Future<bool> registerProcessingDialog(context) {
  return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      pageBuilder: (context, animation1, animation2) {
        return;
      },
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
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
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    //color: simpleBackgroundContainerColor,
                  ),
                  child: Material(
                    borderRadius: BorderRadius.circular(8),
                    color: simpleBackgroundContainerColor,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Center(
                        child: SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.all(5.0),
                            width: 60,
                            height: 60,
                            child: CircularProgressIndicator(
                              backgroundColor: mainColorGreen,
                              strokeWidth: 6,
                            ),
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
