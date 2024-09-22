import 'package:flutter/material.dart';
import 'package:nikah_forever_assignment/features/auth/presentation/views/registration_process_screen.dart';
import 'package:nikah_forever_assignment/features/home/presentation/view/home_scree.dart';

class AppRoutes {
  static Route<dynamic>? onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/registration_process":
        return MaterialPageRoute(builder: (context) => RegistrationProcess());
      case "/home_screen":
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      default:
        return null;
    }
  }
}
