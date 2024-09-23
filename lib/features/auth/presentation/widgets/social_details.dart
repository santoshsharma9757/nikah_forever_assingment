import 'package:flutter/material.dart';
import 'package:nikah_forever_assignment/core/common_widgets/container_with_label.dart';
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
        builder: (context, viewModel, child) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildContainerWithLabel(
              context,
              viewModel,
              hintText: "Marital Status*",
              selectedValue: viewModel.selectedMaritalStatus,
              isValid: viewModel.isMaritalStatusValid,
              bottomSheetKey: 'marital_status',
            ),
            20.height(),
            _buildContainerWithLabel( 
              context,
              viewModel,
              hintText: "Mother Tongue*",
              selectedValue: viewModel.selectedMotherTongue,
              isValid: viewModel.isMotherTongueValid,
              bottomSheetKey: 'mother_tongue',
            ),
            20.height(),
            _buildContainerWithLabel(
              context,
              viewModel,
              hintText: "Sect/Cast*",
              selectedValue: viewModel.fullCast,
              isValid: viewModel.isCastValid,
              bottomSheetKey: 'sect_cast',
            ),
            20.height(),
            _buildContainerWithLabel(
              context,
              viewModel,
              hintText: "Higher Education*",
              selectedValue: viewModel.fullEducation,
              isValid: viewModel.isEducationValid,
              bottomSheetKey: 'higher_education',
            ),
            20.height(),
            _buildContainerWithLabel(
              context,
              viewModel,
              hintText: "Employment*",
              selectedValue: viewModel.fullEmployment,
              isValid: viewModel.isEmploymentValid,
              bottomSheetKey: 'employment',
            ),
            20.height(),
            _buildContainerWithLabel(
              context,
              viewModel,
              hintText: "Occupation*",
              selectedValue: viewModel.fullOccupation,
              isValid: viewModel.isOccupationValid,
              bottomSheetKey: 'occupation',
            ),
            20.height(),
            _buildContainerWithLabel(
              context,
              viewModel,
              hintText: "Annual Income*",
              selectedValue: viewModel.selectedAnnualIncomeRange,
              isValid: viewModel.isAnnualIncomeValid,
              bottomSheetKey: 'annual_income',
            ),
          ],
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
