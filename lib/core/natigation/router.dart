import 'package:go_router/go_router.dart';
import 'package:loggy/62-dars/page/animated.dart';
import 'package:loggy/62-dars/page/external_animation.dart';
import 'package:loggy/62-dars/page/first_page.dart';
import 'package:loggy/62-dars/page/second_page.dart';
import 'package:loggy/62-dars/uy-ishi/claoude_animation.dart';
import 'package:loggy/core/natigation/routes.dart';
import 'package:loggy/loggy/page/home_page.dart';
import 'package:loggy/loggy/page/scroll.dart';
import 'package:loggy/loggy/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

final router = GoRouter(
  initialLocation: Routes.claudeAnimation,
  routes: [
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
    ),
    GoRoute(
      path: Routes.animated,
      builder: (context, state) => Animated(),
    ),
    GoRoute(
      path: Routes.secondPage,
      builder: (context, state) => SecondPage(),
    ),
    GoRoute(
      path: Routes.firstPage,
      builder: (context, state) => FirstPage(),
    ),
    GoRoute(
      path: Routes.external,
      builder: (context, state) => ExternalAnimation(),
    ),
    GoRoute(
      path: Routes.claudeAnimation,
      builder: (context, state) => ClaudeAnimation(),
    ),
  ],
);
