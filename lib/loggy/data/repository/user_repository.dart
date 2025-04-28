import 'package:dio/src/response.dart';
import 'package:loggy/core/client.dart';
import 'package:loggy/loggy/data/model/user_model.dart';

class UserRepository{
  UserRepository({required this.client});
  final ApiClient client;
  UserModel? category;
  String? key;

  Future<bool> login(String email, String password) async {
    final user = await client.login(email, password);
    return user;
  }
  Future<UserModel> home() async {
    if (category != null) return category!;
    final home = await client.home();
    category = UserModel.fromJson(home);
    return category!;
  }
}