import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loggy/core/natigation/routes.dart';
import 'package:loggy/features/widget/app_bar_widget.dart';
import 'package:loggy/features/widget/chevron_widget.dart';
import 'package:loggy/features/widget/elevated_button_widget.dart';

class CanvasDetail extends StatelessWidget {
  const CanvasDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(title: "Canvas Detail"),
      body: Column(
        children: [
          ChevronWidget(
            title: "Dars Topshiriqlari",
            description: [
              ElevatedButtonWidget(
                callback: () {
                  context.push(Routes.canvas);
                },
                text: "Canvas orqali shakllar chizish",
              ),
            ],
          ),
          SizedBox(height: 20,),
          ChevronWidget(
            title: "Uy Ishi",
            description: [
              ElevatedButtonWidget(
                callback: () {
                  context.push(Routes.canvas);
                },
                text: "Canvas orqali shakllar chizish",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
