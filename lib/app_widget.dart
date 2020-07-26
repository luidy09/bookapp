import 'package:bookapp/app/controllers/appcontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: Modular.get<AppController>().themeSwitch,
        builder: (context, isDark, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                brightness: isDark ? Brightness.dark : Brightness.light),
            initialRoute: '/',
            onGenerateRoute: Modular.generateRoute,
            navigatorKey: Modular.navigatorKey,
          );
        });
  }
}
