import 'package:go_router/go_router.dart';
import 'package:push_app/pages/details/details_page.dart';
import 'package:push_app/pages/home/home_page.dart';
import 'package:push_app/pages/notification/notification_page.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomePage.name,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/notification',
      name: NotificationPage.name,
      builder: (context, state) => const NotificationPage(),
    ),
    GoRoute(
      path: '/details/:messageId',
      name: DetailsPage.name,
      builder: (context, state) => DetailsPage(messageId: state.pathParameters['messageId'] ?? ''),
    ),
  ],
);
