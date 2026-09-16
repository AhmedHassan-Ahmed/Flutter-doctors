import 'package:flutter_app/features/auth/login_page.dart';
import 'package:flutter_app/features/auth/signin_page.dart';
import 'package:flutter_app/features/onboarding/onboarding_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const OnboardingPage()),
      GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
      GoRoute(path: '/signin', builder: (context, state) => const SigninPage()),
    ],
  );
}
