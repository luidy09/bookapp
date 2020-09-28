import 'package:bookapp/app/controllers/appcontroller.dart';
import 'package:bookapp/app/data/change_notifier_models/user_notifier.dart';
import 'package:bookapp/app/models/books.dart';
import 'package:bookapp/app/utils/color_custom.dart';
import 'package:bookapp/app/viewsmodels/store/userState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

final userState = UserState();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: Modular.get<AppController>().themeSwitch,
        builder: (context, isDark, child) {
          return MultiProvider(
              providers: [
                ChangeNotifierProvider<Book>(create: (_) => Book()),
                ChangeNotifierProvider<UserNotifier>(
                    create: (_) => UserNotifier()),
              ],
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                    textTheme: GoogleFonts.montserratTextTheme(
                        Theme.of(context).textTheme),
                    primarySwatch: colorCustom,
                    visualDensity: VisualDensity.adaptivePlatformDensity,
                    brightness: isDark ? Brightness.dark : Brightness.light),
                initialRoute: '/',
                onGenerateRoute: Modular.generateRoute,
                navigatorKey: Modular.navigatorKey,
              ));
        });
  }
}
