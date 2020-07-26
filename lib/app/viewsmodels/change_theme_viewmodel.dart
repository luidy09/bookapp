import 'package:bookapp/app/interfaces/local_storage_interface.dart';
import 'package:bookapp/app/models/appconfig_model.dart';

class ChangeThemeViewModel {
  final ILocalStorage storage;
  final AppConfigModel config = AppConfigModel();

  ChangeThemeViewModel({this.storage});

  Future init() async {
    await storage.get('isDark').then((value) {
      if (value != null) {
        config.themeSwitch.value = value;
      }
    });
  }

  //Regra de negocio
  changeTheme(bool value) {
    config.themeSwitch.value = value;
    storage.put('isDark', value);
  }
}
