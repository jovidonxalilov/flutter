// import 'package:flutter/material.dart';
// import 'package:loggy/64-category/view_models/cart_viewmodel.dart';
// import 'package:loggy/64-category/view_models/products_viewmodel.dart';
// import 'package:loggy/64-category/views/screens/products_screen.dart';
// import 'package:provider/provider.dart';
//
// void main() {
//   runApp(const MainApp());
// }
//
// class MainApp extends StatelessWidget {
//   const MainApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (ctx) => CartViewmodel()),
//         ChangeNotifierProvider(create: (ctx) => ProductsViewmodel()),
//       ],
//       child: const MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: ProductsScreen(),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loggy/66-dars/data/quiz_provider.dart';
import 'package:loggy/66-dars/page/journal_daily_detail.dart';
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
      providers: [
        ChangeNotifierProvider(
          create: (context) => QuizProvider(),
        ),
      ],
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
