import 'package:flutter/material.dart';
import 'package:nikah_forever_assignment/core/constants/app_style.dart';
import 'package:nikah_forever_assignment/core/extensions/app_extensions.dart';

class CustomStepper extends StatelessWidget {
  final int currentStep;
  final Function(int) onStepChanged;
  final int stepCount;
  final List<String> stepLabels; // Changed from String to List<String>

  const CustomStepper({
    super.key,
    required this.currentStep,
    required this.onStepChanged,
    required this.stepCount,
    required this.stepLabels, // Updated to accept a list of labels
  });

  final Color _stepColor = AppColors.primary;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(stepCount, (index) {
            return Row(
              children: [
                _buildStep(index),
                if (index < stepCount - 1) _buildLine(index),
              ],
            );
          }),
        ),
        10.width(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(stepCount, (index) {
            return _buildStepLabel(
                stepLabels[index], index); // Use stepLabels[index]
          }),
        ),
      ],
    );
  }

  Widget _buildStep(int step) {
    return GestureDetector(
      onTap: () {
        if (step == 0 || (step > 0 && _isStepCompleted(step - 1))) {
          onStepChanged(step);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.small),
        child: Container(
          width: 27,
          height: 27,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: _stepColor,
              width: 2.0,
            ),
            color: currentStep > step ? _stepColor : Colors.white,
          ),
          child: Center(
            child: currentStep > step
                ? const Icon(Icons.check, color: Colors.white)
                : Text(
                    (step + 1).toString(),
                    style: TextStyle(
                      color: currentStep == step
                          ? _stepColor
                          : AppColors.lightGrey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildLine(int index) {
    double lineWidth = 80.0;
    double partialWidth = lineWidth / 2;

    return Stack(
      children: [
        // Background line (Grey)
        Container(
          width: lineWidth,
          height: 4,
          decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.circular(20)),
        ),
        // Foreground line (Primary color)
        Container(
          width: currentStep > index
              ? lineWidth
              : currentStep == index
                  ? partialWidth
                  : 0,
          height: 4,
          decoration: BoxDecoration(
              color: _stepColor, borderRadius: BorderRadius.circular(20)),
        ),
      ],
    );
  }

  Widget _buildStepLabel(String label, int step) {
    return SizedBox(
      width: 120,
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w400,
            color: currentStep >= step ? _stepColor : AppColors.darkGrey,
          ),
        ),
      ),
    );
  }

  bool _isStepCompleted(int step) {
    return true;
  }
}
