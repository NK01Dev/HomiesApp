// core/router/app_router.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homies_app/core/constants/page_name.dart';
import 'package:homies_app/core/router/routes.dart';
import 'package:homies_app/presentation/auth/login/login_bindings.dart';
import 'package:homies_app/presentation/auth/login/login_view.dart';
import 'package:homies_app/presentation/auth/register/register_bindings.dart';
import 'package:homies_app/presentation/auth/register/register_view.dart';
import 'package:homies_app/presentation/splash/splash_bindings.dart';
import 'package:homies_app/presentation/splash/splas_view.dart';
import 'package:injectable/injectable.dart';

@singleton
class AppRouter {
  late final GoRouter _router;

  AppRouter() {
    _router = GoRouter(
      debugLogDiagnostics: true,
      initialLocation: '/',
      routes: [
        GoRoute(
          path: pageName.splash,
          builder: (context, state) {
            /*  run the binding before the widget is built  */
            SplashBindings().dependencies();
            return const SplashView();
          },
        ),
        GoRoute(
          path: pageName.auth,
          builder: (context, state) {
            /*  run the binding before the widget is built  */
            LoginBindings().dependencies();
            return  LoginView();
          },
        ),
        GoRoute(path: pageName.register,
        builder: (context, state) {
          RegisterBindings().dependencies();
          return RegisterView();
        },
        )
      ],
    );
  }

  GoRouter get router => _router;
}