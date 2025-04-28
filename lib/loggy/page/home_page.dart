import 'package:flutter/material.dart';
import 'package:loggy/loggy/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<UserViewModel>();
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      appBar: AppBar(
        title: Center(
          child: Text(
            "Home",
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, right: 25, left: 25),
        child: Column(
          children: [
            Image.network(vm.user!.image),
          ],
        ),
      ),
    );
  }
}
