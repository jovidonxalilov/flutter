import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second Page"),),
      body: Align(
        alignment: Alignment.bottomRight,
          child: Hero(tag: 'hero-tag', child: Image.asset("assets/image3.png", width: double.infinity, height: 300,))),
    );
  }
}
