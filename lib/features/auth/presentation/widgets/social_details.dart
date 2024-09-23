import 'package:flutter/material.dart';
import 'package:nikah_forever_assignment/core/common_widgets/container_with_label.dart';
import 'package:nikah_forever_assignment/core/constants/app_string.dart';
import 'package:nikah_forever_assignment/core/extensions/app_extensions.dart';
import 'package:nikah_forever_assignment/core/utils/app_utils.dart';
import 'package:nikah_forever_assignment/features/auth/view_model/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class SocialDetailStep extends StatelessWidget {
  const SocialDetailStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Consumer<AuthViewModel>(
        builder: (context, viewModel, child) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildContainerWithLabel(
                context,
                viewModel,
                hintText: AppString.maritalStatus,
                selectedValue: viewModel.selectedMaritalStatus,
                isValid: viewModel.isMaritalStatusValid,
                bottomSheetKey: AppStringKey.maritalStatus,
              ),
              20.height(),
              _buildContainerWithLabel(
                context,
                viewModel,
                hintText: AppString.motherTongue,
                selectedValue: viewModel.selectedMotherTongue,
                isValid: viewModel.isMotherTongueValid,
                bottomSheetKey: AppStringKey.motherTongue,
              ),
              20.height(),
              _buildContainerWithLabel(
                context,
                viewModel,
                hintText: AppString.sectCast,
                selectedValue: viewModel.fullCast,
                isValid: viewModel.isCastValid,
                bottomSheetKey: AppStringKey.sectCast,
              ),
              20.height(),
              _buildContainerWithLabel(
                context,
                viewModel,
                hintText: AppString.higherEducation,
                selectedValue: viewModel.fullEducation,
                isValid: viewModel.isEducationValid,
                bottomSheetKey: AppStringKey.higherEducation,
              ),
              20.height(),
              _buildContainerWithLabel(
                context,
                viewModel,
                hintText: AppString.employement,
                selectedValue: viewModel.fullEmployment,
                isValid: viewModel.isEmploymentValid,
                bottomSheetKey: AppString.employement,
              ),
              20.height(),
              _buildContainerWithLabel(
                context,
                viewModel,
                hintText: AppString.occupation,
                selectedValue: viewModel.fullOccupation,
                isValid: viewModel.isOccupationValid,
                bottomSheetKey: AppStringKey.occupation,
              ),
              20.height(),
              _buildContainerWithLabel(
                context,
                viewModel,
                hintText: AppString.annualIncome,
                selectedValue: viewModel.selectedAnnualIncomeRange,
                isValid: viewModel.isAnnualIncomeValid,
                bottomSheetKey: AppString.annualIncome,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContainerWithLabel(
    BuildContext context,
    AuthViewModel viewModel, {
    required String hintText,
    required String? selectedValue,
    required bool isValid,
    required String bottomSheetKey,
  }) {
    return GestureDetector(
      onTap: () {
        AppUtils.showCommonBottomSheet(context, bottomSheetKey);
      },
      child: ContainerWithLabel(
        hintText: hintText,
        selectedValue: selectedValue ?? '',
        isValid: isValid,
      ),
    );
  }
}
