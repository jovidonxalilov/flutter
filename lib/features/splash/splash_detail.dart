import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loggy/66-dars/auth/manager/user_view_modek.dart';
import 'package:loggy/core/color/app_colors.dart';
import 'package:loggy/core/natigation/routes.dart';
import 'package:provider/provider.dart';

class SplashDetail extends StatelessWidget {
  const SplashDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: FutureBuilder(
          future: context.read<AuthViewModel>().getAuth(),
          builder: (context, snapshot) {
            print('Snapshot status: ${snapshot.connectionState}');
            print('Snapshot has data: ${snapshot.hasData}');
            print('Snapshot data: ${snapshot.data}');
            print('Snapshot has error: ${snapshot.hasError}');
            if (snapshot.hasError) {
              print('Error: ${snapshot.error}');
            }

            if (snapshot.connectionState == ConnectionState.done) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (snapshot.hasData) {
                  print('Navigating to home...');
                  context.go(Routes.home);
                } else {
                  print('Navigating to login...');
                  context.go(Routes.login);
                }
              });
            }
            return const FlutterLogo(size: 100);
          },
        ),


      ),
    );
  }
}









