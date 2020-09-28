import 'package:bookapp/app/models/library_model.dart';
import 'package:bookapp/app/models/user_model.dart';
import 'package:mobx/mobx.dart';

part 'userState.g.dart';

class UserState = _UserState with _$UserState;

abstract class _UserState with Store {
  @observable
  int count = 0;

  @observable
  UserModel userModel;

  @observable
  LibraryModel libraryModel;

  @action
  increment() {
    count++;
  }

  @action
  setCount(value) {
    count = value;
  }

  @action
  changeUserModel(UserModel user) {
    userModel = user;
  }

  @action
  changeLibraryModel(LibraryModel library) {
    libraryModel = library;
  }

  @action
  changeName(nome) {
    userModel.nome = nome;
    //userModel = new UserModel(nome: nome);
  }
}
