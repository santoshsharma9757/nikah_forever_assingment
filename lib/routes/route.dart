import 'package:flutter/material.dart';
import 'package:nikah_forever_assignment/core/constants/app_string.dart';
import 'package:nikah_forever_assignment/features/auth/presentation/views/registration_process_screen.dart';
import 'package:nikah_forever_assignment/features/home/presentation/view/home_screen.dart';

class AppRoutes {
  static Route<dynamic>? onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRouteString.registrationProcess:
        return MaterialPageRoute(builder: (context) => RegistrationProcess());
      case AppRouteString.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      default:
        return null;
    }
  }
}
