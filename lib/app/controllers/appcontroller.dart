import 'package:bookapp/app/viewsmodels/change_theme_viewmodel.dart';
import 'package:flutter/material.dart';

class AppController {
  final ChangeThemeViewModel changeThemeViewModel;

  AppController(this.changeThemeViewModel) {
    changeThemeViewModel.init();
  }

  bool get isDark => changeThemeViewModel.config.themeSwitch.value;
  ValueNotifier<bool> get themeSwitch =>
      changeThemeViewModel.config.themeSwitch;
}
