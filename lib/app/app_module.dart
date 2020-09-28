import 'package:bookapp/app/controllers/appcontroller.dart';
import 'package:bookapp/app/interfaces/local_storage_interface.dart';
import 'package:bookapp/app/services/shared_local_storage_service.dart';
import 'package:bookapp/app/views/carousel/carousel_pageview.dart';
import 'package:bookapp/app/views/dashboard/dashboard_page.dart';
import 'package:bookapp/app/views/details/details_page.dart';
import 'package:bookapp/app/views/exchange/exchange.dart';
import 'package:bookapp/app/views/form/form_page.dart';
import 'package:bookapp/app/views/home/home_page.dart';
import 'package:bookapp/app/views/library/library.dart';
import 'package:bookapp/app/views/library_user/library_profile_owner.dart';
import 'package:bookapp/app/views/publication/publication.dart';
import 'package:bookapp/app/views/publication/publication_available.dart';
import 'package:bookapp/app/views/sale/sale.dart';
import 'package:bookapp/app/views/sale/sale_available.dart';
import 'package:bookapp/app/views/settings/settings_page.dart';
import 'package:bookapp/app/viewsmodels/change_theme_viewmodel.dart';
import 'package:bookapp/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends MainModule {
  @override
//Injeção de depêndencia o (i)=(injection)
  List<Bind> get binds {
    return [
      Bind((i) => AppController(i.get()), lazy: false),
      Bind((i) => ChangeThemeViewModel(storage: i.get())),
      Bind<ILocalStorage>((i) => SharedLocalStorageServices()),
    ];
  }

  @override
  //main
  Widget get bootstrap => MyApp();

  @override
  //Routas
  List<Router> get routers => [
        Router('/', child: (context, args) => CarouselPageView()),
        Router('/home', child: (context, args) => HomePage()),
        Router('/settings', child: (context, args) => SettingsPage()),
        Router('/dashboard', child: (context, args) => DashboardPage()),
        Router('/formu', child: (context, args) => FormPage()),
        Router('/detail', child: (context, args) => DetailsPage()),
        Router('/library', child: (context, args) => Library()),
        Router('/publication', child: (context, args) => Publication()),
        Router('/publication_available',
            child: (context, args) => PublicationAvailable()),
        Router('/exchange', child: (context, args) => Exchange()),
        Router('/sale', child: (context, args) => Sale()),
        Router('/sale_available', child: (context, args) => SaleAvailable()),
        Router('/library_profile',
            child: (context, args) => LibraryProfileOwner()),
        Router('/reader_home', child: (context, args) => HomePage()),
      ];
}
