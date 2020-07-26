import 'package:bookapp/app/controllers/appcontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(   value: Modular.get<AppController>().isDark,
        onChanged: (value) {
          Modular.get<AppController>().changeThemeViewModel.changeTheme(value);
        });
      
   
  }
}