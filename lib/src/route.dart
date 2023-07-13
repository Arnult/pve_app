import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:pve_app/src/screens/login_screen.dart';
import 'package:pve_app/src/screens/splash_screen.dart';


part 'route.g.dart';

final GoRouter router = GoRouter(routes: $appRoutes);

@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const LoginScreen();
}


@TypedGoRoute<SplashRoute>(path: '/')
class SplashRoute extends GoRouteData {
  const SplashRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SplashScreen();
}