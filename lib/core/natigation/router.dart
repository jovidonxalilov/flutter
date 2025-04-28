import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:loggy/core/client.dart';
import 'package:loggy/core/natigation/routes.dart';
import 'package:loggy/loggy/data/repository/user_repository.dart';
import 'package:loggy/loggy/page/home_page.dart';
import 'package:loggy/loggy/page/scroll.dart';
import 'package:loggy/loggy/page/user_detail.dart';
import 'package:loggy/loggy/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

final router = GoRouter(initialLocation: Routes.scroll, routes: [
  GoRoute(
    path: Routes.login,
    builder: (context, state) => ChangeNotifierProvider(
      create: (context) {
        UserViewModel(repo: context.read());
      },
      child: HomePage(),
    ),
  ),
  GoRoute(
    path: Routes.home,
    builder: (context, state) => ChangeNotifierProvider(
      create: (context) {
        UserViewModel(
          repo: context.read(),
        );
      },
      child: HomePage(),
    ),
  ),
  GoRoute(
    path: Routes.scroll,
    builder: (context, state) => Scroll(),
  )
]);
