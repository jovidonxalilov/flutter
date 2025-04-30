import 'package:go_router/go_router.dart';
import 'package:loggy/62-dars/page/62-detail.dart';
import 'package:loggy/62-dars/page/dars/animated.dart';
import 'package:loggy/62-dars/page/dars/external_animation.dart';
import 'package:loggy/62-dars/page/dars/first_page.dart';
import 'package:loggy/62-dars/page/dars/second_page.dart';
import 'package:loggy/62-dars/page/uy-ishi/claoude_animation.dart';
import 'package:loggy/63-dars/page/canvas_detail.dart';
import 'package:loggy/63-dars/page/dars/canvas.dart';
import 'package:loggy/63-dars/page/uy-ishi/soat_detail.dart';
import 'package:loggy/core/natigation/routes.dart';
import 'package:loggy/features/home/page/home_page.dart';
import 'package:loggy/loggy/page/scroll.dart';

final router = GoRouter(
  initialLocation: Routes.soat,
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (context, state) => HomePage(),
    ),
    // GoRoute(
    //   path: Routes.login,
    //   builder: (context, state) => ChangeNotifierProvider(
    //     create: (context) {
    //       UserViewModel(repo: context.read());
    //     },
    //     child: HomePage(),
    //   ),
    // ),
    // GoRoute(
    //   path: Routes.home,
    //   builder: (context, state) => ChangeNotifierProvider(
    //     create: (context) {
    //       UserViewModel(
    //         repo: context.read(),
    //       );
    //     },
    //     child: HomePage(),
    //   ),
    // ),
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
    GoRoute(
      path: Routes.canvas,
      builder: (context, state) => CanvasWidget(),
    ),
    GoRoute(
      path: Routes.canvasDetail,
      builder: (context, state) => CanvasDetail(),
    ),
    GoRoute(
      path: Routes.animatedDetail,
      builder: (context, state) => AnimatedDetail(),
    ),
    GoRoute(
      path: Routes.soat,
      builder: (context, state) => SoatDetail(),
    ),
  ],
);
