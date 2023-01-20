import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';

import 'package:task_hassnain/user_model.dart';
import 'package:username_gen/username_gen.dart';

class UsersProvider extends ChangeNotifier {
  final List usersData = [];

  Random randomNumber = Random();

  int listSize = 0;

  int get listCount {
    return listSize;
  }

  Stream<User> generateUsers() async* {
    // await Future<void>.delayed(const Duration(seconds: 2));

    await Future<void>.delayed(const Duration(seconds: 5));

    yield User(UsernameGen().generate().toString(),
        "abc${randomNumber.nextInt(50)}@gmail.com");
    print(listSize++);

    notifyListeners();
  }

  void updateList() {
    usersData[randomNumber.nextInt(usersData.length)] =
        User('Updated Item', 'Updated Email');

    notifyListeners();
  }

  void delete() {
    usersData.remove(0);

    notifyListeners();
  }
}
