import "dart:convert";

import 'package:bookapp/app/models/user_model.dart';
import 'package:flutter/material.dart';

class UserNotifier extends ChangeNotifier {
  UserModel userModel;
  String name = "Edro";

  changeUserModel(UserModel userModel) {
    this.userModel = userModel;
    notifyListeners();
  }

  changeName(nome) {
    this.name = name;
    notifyListeners();
  }

  changeProfilePhoto(String avatar) {
    this.userModel.avatar = avatar;
    notifyListeners();
  }
}
