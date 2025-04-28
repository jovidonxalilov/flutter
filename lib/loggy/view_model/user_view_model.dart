import 'package:flutter/cupertino.dart';
import 'package:loggy/loggy/data/model/user_model.dart';

import '../data/repository/user_repository.dart';

class UserViewModel {
  UserViewModel({required UserRepository repo}) : _repo = repo;

  final UserRepository _repo;

  UserModel? user; // category emas, aniqroq nom beramiz

  final formKey = GlobalKey<FormState>();
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  Future<bool> login() async {
    final result = await _repo.login(loginController.text, passwordController.text);
    if (result != null) {
      user = result as UserModel?; // foydalanuvchi ma'lumotini saqlab qo'yamiz
      return true;
    }
    return false;
  }

  Future<UserModel> home() async {
    if (user == null) {
      throw Exception("User is not logged in");
    }
    final homes = await _repo.home();
    return homes;
  }
}
