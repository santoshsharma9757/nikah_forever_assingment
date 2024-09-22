import 'package:flutter/material.dart';
import 'package:nikah_forever_assignment/features/auth/presentation/components/verification/verification.dart';
import 'package:nikah_forever_assignment/features/auth/presentation/widgets/basic_details.dart';
import 'package:nikah_forever_assignment/features/auth/presentation/widgets/social_details.dart';
import 'package:nikah_forever_assignment/features/auth/presentation/widgets/stepper.dart';


class RegistrationProcess extends StatelessWidget {
  final List<Widget> steps = [
    const BasicDetailsStep(),
    const SocialDetailStep(),
    const VerificationStep(),
  ];
  RegistrationProcess({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StepperWithLines(steps: steps),
    );
  }
}


