import 'package:flutter/material.dart';
import 'package:nikah_forever_assignment/core/common_widgets/common_button.dart';
import 'package:nikah_forever_assignment/core/common_widgets/container_widget.dart';
import 'package:nikah_forever_assignment/core/common_widgets/custom_text_field.dart';
import 'package:nikah_forever_assignment/core/constants/app_string.dart';
import 'package:nikah_forever_assignment/core/constants/app_style.dart';
import 'package:nikah_forever_assignment/core/constants/app_text_style.dart';
import 'package:nikah_forever_assignment/core/extensions/app_extensions.dart';
import 'package:nikah_forever_assignment/core/utils/app_utils.dart';
import 'package:nikah_forever_assignment/features/auth/view_model/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class BasicDetailsStep extends StatelessWidget {
  const BasicDetailsStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Consumer<AuthViewModel>(builder: (context, viewModel, child) {
        return SingleChildScrollView(
          key: UniqueKey(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              12.height(),
              _buildCustomInputField(viewModel),
              20.height(),
              _buildContainerWithLabel(
                context,
                viewModel,
                hintText: "Date of birth*",
                selectedValue: viewModel.selectedDateOfBirth,
                isValid: viewModel.isDateOfBirthValid,
                bottomSheetKey: 'date_of_birth',
              ),
              20.height(),
              _buildContainerWithLabel(
                context,
                viewModel,
                hintText: "Height*",
                selectedValue: viewModel.selectedHeight,
                isValid: viewModel.isHeightValid,
                bottomSheetKey: 'height',
              ),
              20.height(),
              _buildContainerWithLabel(
                context,
                viewModel,
                hintText: "Address*",
                selectedValue: viewModel.fullAddress,
                isValid: viewModel.isAddressValid,
                bottomSheetKey: 'address',
              ),
              20.height(),
              const Text(
                "Do you live with your family?",
                style: AppTextStyles.caption,
              ),
              10.height(),
              _buildFamilyButtons(viewModel, context),
              20.height(),
              if (viewModel.isLivedWithFamily !=null&&viewModel.isLivedWithFamily)
                _buildContainerWithLabel(
                  context,
                  viewModel,
                  hintText: "Where does your family live*",
                  selectedValue: viewModel.fullAddress2,
                  isValid: true,
                  bottomSheetKey: 'address2',
                ),
              10.height(),
              _buildLogoutButton(context),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildCustomInputField(AuthViewModel viewModel) {
    return CustomInputField(
      key: UniqueKey(),
      controller: viewModel.nameController,
      label: "Enter your name",
      errorMessage: viewModel.isNameValid ? null : AppString.emptyErrorMessage,
      isValid: viewModel.isNameValid,
      onChanged: (value) {
        viewModel.validateBasicDetails();
      },
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
        AppUtils.showCommonBottomSheetBasicDetail(context, bottomSheetKey);
      },
      child: ContainerWithLabel(
        hintText: hintText,
        selectedValue: selectedValue ?? '',
        isValid: isValid,
      ),
    );
  }

  Widget _buildFamilyButtons(AuthViewModel viewModel, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildFamilyButton(
          text: "Yes",
          isSelected:
              viewModel.isLivedWithFamily == false, // Only selected if false
          onPressed: () {
            viewModel.setIsLivedWithFamily(false);
          },
          context: context,
        ),
        30.width(),
        _buildFamilyButton(
          text: "No",
          isSelected:
              viewModel.isLivedWithFamily == true, // Only selected if true
          onPressed: () {
            viewModel.setIsLivedWithFamily(true);
          },
          context: context,
        ),
      ],
    );
  }

  Widget _buildFamilyButton({
    required String text,
    required bool isSelected,
    required VoidCallback onPressed,
    required BuildContext context,
  }) {
    return CustomButton(
      text: text,
      onPressed: onPressed,
      borderRadius: 15.0,
      buttonColor: isSelected ? AppColors.primary : AppColors.white,
      border: Border.all(
        color: isSelected ? AppColors.primary : AppColors.lightGrey,
      ),
      textColor: isSelected ? AppColors.white : AppColors.darkGrey,
      width: context.screenWidth * 0.3,
      height: 35.0,
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return CustomButton(
      text: "Logout",
      onPressed: () {
        AppUtils.showMyDialog("Logout", "Are you sure want to logout", context);
      },
      borderRadius: 5.0,
      buttonColor: AppColors.extraLightGrey,
      textColor: AppColors.darkGrey,
      width: context.screenWidth * 0.15,
      height: 30.0,
    );
  }
}
