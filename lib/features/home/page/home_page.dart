import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loggy/core/color/app_colors.dart';
import 'package:loggy/core/natigation/routes.dart';
import 'package:loggy/features/home/page/home_page.dart';
import 'package:loggy/features/widget/elevated_button_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(
          child: Text(
            "Flutter",
            style: TextStyle(
              color: AppColors.black,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, right: 15, left: 15),
        child: ListView(
          children: [
            Column(
              spacing: 10,
              children: [
                ElevatedButtonWidget(
                  callback: () {
                    context.push(Routes.animatedDetail);
                  },
                  text: "Animated 62-dars",
                ),
                ElevatedButtonWidget(
                  callback: () {
                    context.push(Routes.canvasDetail);
                  },
                  text: "Canvas 63-dars",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
