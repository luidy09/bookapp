import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';

import 'app/app_module.dart';
import 'app/models/books.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<Book>(create: (_) => Book()),
  ], child: ModularApp(module: AppModule())));
}
