import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ApiClient {
  final loginController = "ali";
  final passwordController = "123456";
  final Dio dio = Dio(BaseOptions(baseUrl: "https://salom-boyvachha-default-rtdb.asia-southeast1.firebasedatabase.app"));

  Future<bool> login(String email, String password) async {
    try {
      final response = await dio.get('/users.json');
      final data = response.data as Map<String, dynamic>;

      return data.values.any((user) =>
      user['email'] == email && user['password'].toString() == password);
    } catch (e) {
      print("xatolik: $e");
      return false;
    }
  }
  Future<dynamic> home() async {
    final response = await dio.get('/users.json');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('/users.json malumot kelmadi....');
    }
  }
}
