// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userState.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserState on _UserState, Store {
  final _$countAtom = Atom(name: '_UserState.count');

  @override
  int get count {
    _$countAtom.reportRead();
    return super.count;
  }

  @override
  set count(int value) {
    _$countAtom.reportWrite(value, super.count, () {
      super.count = value;
    });
  }

  final _$userModelAtom = Atom(name: '_UserState.userModel');

  @override
  UserModel get userModel {
    _$userModelAtom.reportRead();
    return super.userModel;
  }

  @override
  set userModel(UserModel value) {
    _$userModelAtom.reportWrite(value, super.userModel, () {
      super.userModel = value;
    });
  }

  final _$libraryModelAtom = Atom(name: '_UserState.libraryModel');

  @override
  LibraryModel get libraryModel {
    _$libraryModelAtom.reportRead();
    return super.libraryModel;
  }

  @override
  set libraryModel(LibraryModel value) {
    _$libraryModelAtom.reportWrite(value, super.libraryModel, () {
      super.libraryModel = value;
    });
  }

  final _$_UserStateActionController = ActionController(name: '_UserState');

  @override
  dynamic increment() {
    final _$actionInfo =
        _$_UserStateActionController.startAction(name: '_UserState.increment');
    try {
      return super.increment();
    } finally {
      _$_UserStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCount(dynamic value) {
    final _$actionInfo =
        _$_UserStateActionController.startAction(name: '_UserState.setCount');
    try {
      return super.setCount(value);
    } finally {
      _$_UserStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeUserModel(UserModel user) {
    final _$actionInfo = _$_UserStateActionController.startAction(
        name: '_UserState.changeUserModel');
    try {
      return super.changeUserModel(user);
    } finally {
      _$_UserStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeLibraryModel(LibraryModel library) {
    final _$actionInfo = _$_UserStateActionController.startAction(
        name: '_UserState.changeLibraryModel');
    try {
      return super.changeLibraryModel(library);
    } finally {
      _$_UserStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeName(dynamic nome) {
    final _$actionInfo =
        _$_UserStateActionController.startAction(name: '_UserState.changeName');
    try {
      return super.changeName(nome);
    } finally {
      _$_UserStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
count: ${count},
userModel: ${userModel},
libraryModel: ${libraryModel}
    ''';
  }
}
