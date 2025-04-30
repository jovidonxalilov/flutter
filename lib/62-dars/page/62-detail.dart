import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loggy/core/natigation/routes.dart';
import 'package:loggy/features/widget/app_bar_widget.dart';
import 'package:loggy/features/widget/chevron_widget.dart';
import 'package:loggy/features/widget/elevated_button_widget.dart';

class AnimatedDetail extends StatelessWidget {
  const AnimatedDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        title: "Animated",
      ),
      body: Column(
        spacing: 20,
        children: [
          ChevronWidget(
            title: "Dars topshiriqlari",
            description: [
              ElevatedButtonWidget(
                callback: () {
                  context.push(Routes.animated);
                },
                text: "Animatsiyalar",
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButtonWidget(
                callback: () {
                  context.push(Routes.external);
                },
                text: "Animated Controller",
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButtonWidget(
                callback: () {
                  context.push(Routes.firstPage);
                },
                text: "Hero Animation",
              ),
            ],
          ),
          ChevronWidget(
            title: "Uy Ishi",
            description: [
              ElevatedButtonWidget(
                  callback: () {
                    context.push(Routes.claudeAnimation);
                  },
                  text: "Claude Animation",
              ),
            ],
          )
        ],
      ),
    );
  }
}
