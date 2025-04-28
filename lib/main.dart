import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loggy/core/dependetsy/provider.dart';
import 'package:loggy/core/natigation/router.dart';
import 'package:loggy/loggy/page/user_detail.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      builder: (context, child) => ScreenUtilInit(
        designSize: Size(430, 932),
        child: MaterialApp.router(
          routerConfig: router,
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
        ),
      ),
    );
  }
}

