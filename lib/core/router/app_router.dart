import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

@singleton
class AppRouter {
  final GoRouter _router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/',
    routes: [
    GoRoute(
    path: '/',
    // builder: (context, state) => const HomeScreen(),
  ),
      GoRoute(
  path: '/profile',
  // builder: (context, state) => const UserDetailsScreen(),
  ),
  // Add more routes as needed
  ]);

  GoRouter get router => _router;
}
