import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:nikah_forever_assignment/core/common_widgets/common_button.dart';
import 'package:nikah_forever_assignment/core/common_widgets/custom_stepper.dart';
import 'package:nikah_forever_assignment/core/constants/app_style.dart';
import 'package:nikah_forever_assignment/core/constants/app_text_style.dart';
import 'package:nikah_forever_assignment/core/extensions/app_extensions.dart';
import 'package:nikah_forever_assignment/features/auth/view_model/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class StepperWithLines extends StatefulWidget {
  final List<Widget> steps;
  const StepperWithLines({super.key, required this.steps});
  @override
  State<StepperWithLines> createState() => _StepperWithLinesState();
}

class _StepperWithLinesState extends State<StepperWithLines> {
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    final availableHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).viewInsets.bottom;
    return ScaffoldMessenger(
      key: _scaffoldMessengerKey,
      child: WillPopScope(
        onWillPop: onWillPop,
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: availableHeight,
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  60.height(),
                  _buildStepper(),
                  30.height(),
                  _buildStepContent(),
                  const Spacer(),
                  _navigationButtons(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  final List<String> stepLabels = [
    "Basic Details",
    "Social Details",
    "Verification"
  ];

  Widget _buildStepper() {
    return CustomStepper(
      currentStep: _currentStep,
      onStepChanged: (step) {
        setState(() {
          _currentStep = step;
        });
      },
      stepCount: widget.steps.length,
      stepLabels: stepLabels,
    );
  }

  Widget _buildStepContent() {
    return widget.steps[_currentStep];
  }

  Widget _navigationButtons() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Consumer<AuthViewModel>(
        builder: (context, viewModel, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomButton(
              text: _currentStep == widget.steps.length - 1 ? "Finish" : "Next",
              textStyle: AppTextStyles.heading3,
              onPressed: () {
                if (_currentStep < widget.steps.length - 1) {
                  if (_validateAndProceed(viewModel)) {
                    setState(() {
                      _currentStep++;
                    });
                  } else {
                    log("ALL FIELD REQUIRED");
                  }
                } else {
                  Navigator.pushNamed(context, '/home_screen');
                }
              },
              borderRadius: 15.0,
              buttonColor: AppColors.primary,
              textColor: Colors.white,
              width: double.infinity,
              height: 45.0,
            ),
          );
        },
      ),
    );
  }

  bool _validateAndProceed(AuthViewModel viewModel) {
    // Validate basic details
    viewModel.validateBasicDetails();
    // Validate social details if applicable (check based on _currentStep)
    if (_currentStep == 1) {
      viewModel.validateSocialDetails();
    }
    // Check if all validations pass for the current step
    return (viewModel.isDateOfBirthValid &&
        viewModel.isHeightValid &&
        viewModel.isAddressValid &&
        viewModel.isLivedWithFamily != null&&
        // viewModel.isAddress2Valid &&
        viewModel.isNameValid &&
        (_currentStep == 1 ? viewModel.isMaritalStatusValid : true) &&
        (_currentStep == 1 ? viewModel.isMotherTongueValid : true) &&
        (_currentStep == 1 ? viewModel.isCastValid : true) &&
        (_currentStep == 1 ? viewModel.isEducationValid : true) &&
        (_currentStep == 1 ? viewModel.isEmploymentValid : true) &&
        (_currentStep == 1 ? viewModel.isOccupationValid : true) &&
        (_currentStep == 1 ? viewModel.isAnnualIncomeValid : true));
  }

  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  DateTime? _lastBackPressed;
  Future<bool> onWillPop() async {
    final now = DateTime.now();
    if (_lastBackPressed == null ||
        now.difference(_lastBackPressed!) > const Duration(seconds: 2)) {
      _lastBackPressed = now;
      _scaffoldMessengerKey.currentState?.showSnackBar(
        const SnackBar(
          content: Text('Press again to exit'),
          duration: Duration(seconds: 2),
        ),
      );
      return false;
    }
    return true;
  }
}
