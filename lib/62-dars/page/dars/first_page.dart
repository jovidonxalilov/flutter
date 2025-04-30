import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loggy/core/natigation/routes.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Page"),
      ),
      body: GestureDetector(
        onTap: () {
         context.push(Routes.secondPage);
        },
        child: Hero(
          tag: 'hero-tag',
          child: Image.asset(
            "assets/image.png",
            width: 150,
            height: 150,
          ),

        ),
      ),
    );
  }
}
