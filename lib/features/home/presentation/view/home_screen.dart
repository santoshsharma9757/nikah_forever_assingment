import 'package:flutter/material.dart';
import 'package:nikah_forever_assignment/core/constants/app_string.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppString.appName)),
      body: const Center(child: Text(AppString.homeScreenMessage)),
    );
  }
}
