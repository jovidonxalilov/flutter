import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:loggy/malumotlar/model/model.dart';
import 'package:http/http.dart' as http;

class PostProvider with ChangeNotifier {
  List<PostModel> _posts = [];
  bool _isLoading = false;

  List<PostModel> get posts => _posts;
  bool get isLoading => _isLoading;

  Future<void> fetchPosts() async {
    _isLoading = true;
    notifyListeners();

    final response =
    await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      _posts = jsonData.map((json) => PostModel.fromJson(json)).toList();
    }

    _isLoading = false;
    notifyListeners();
  }
}
