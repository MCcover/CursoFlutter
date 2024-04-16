import 'package:go_router/go_router.dart';
import 'package:widgets_app/pages/animated/animated_page.dart';
import 'package:widgets_app/pages/app_tutorial/app_tutorial_page.dart';
import 'package:widgets_app/pages/buttons/buttons_page.dart';
import 'package:widgets_app/pages/cards/cards_page.dart';
import 'package:widgets_app/pages/counter/counter_page.dart';
import 'package:widgets_app/pages/home_page.dart';
import 'package:widgets_app/pages/infinite_scroll/infinite_scroll_page.dart';
import 'package:widgets_app/pages/progress/progress_page.dart';
import 'package:widgets_app/pages/snackbar/snackbar_page.dart';
import 'package:widgets_app/pages/theme_changer/theme_changer_page.dart';
import 'package:widgets_app/pages/ui_controls/ui_controls_page.dart';

final appRoutes = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/buttons',
      builder: (context, state) => const ButtonsPage(),
    ),
    GoRoute(
      path: '/cards',
      builder: (context, state) => const CardsPage(),
    ),
    GoRoute(
      path: '/animated',
      builder: (context, state) => const AnimatedPage(),
    ),
    GoRoute(
      path: '/tutorial',
      builder: (context, state) => const AppTutorialPage(),
    ),
    GoRoute(
      path: '/infinite',
      builder: (context, state) => const InfinitePage(),
    ),
    GoRoute(
      path: '/progress',
      builder: (context, state) => const ProgressPage(),
    ),
    GoRoute(
      path: '/snackbar',
      builder: (context, state) => const SnackbarPage(),
    ),
    GoRoute(
      path: '/ui_controls',
      builder: (context, state) => const UiControlsPage(),
    ),
    GoRoute(
      path: '/counter',
      builder: (context, state) => const CounterPage(),
    ),
    GoRoute(
      path: '/theme-changer',
      builder: (context, state) => const ThemeChangerPage(),
    ),
  ],
);
