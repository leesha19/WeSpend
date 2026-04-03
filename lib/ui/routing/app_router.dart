import 'package:go_router/go_router.dart';
import 'package:wespend/ui/auth/login.dart';
import 'package:wespend/ui/splash/splash.dart';


final GoRouter appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const Login(),
    ),
    // GoRoute(
    //   path: '/home',
    //   builder: (context, state) => const Dash(),
    // ),
  ],
);