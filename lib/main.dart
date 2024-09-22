import 'package:flutter/material.dart';
import 'package:nikah_forever_assignment/core/constants/app_style.dart';
import 'package:nikah_forever_assignment/features/auth/view_model/auth_viewmodel.dart';
import 'package:nikah_forever_assignment/routes/route.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthViewModel())],
      child: MaterialApp(
        theme: ThemeData(primarySwatch: AppColors.customColor),
        initialRoute: '/registration_process',
        onGenerateRoute: AppRoutes.onGeneratedRoute,
      ),
    );
  }
}
