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
              CustomInputField(
                key: UniqueKey(),
                controller: viewModel.nameController,
                label: "Enter your name",
                errorMessage:
                    viewModel.isNameValid ? null : AppString.emptyErrorMessage,
                isValid: viewModel.isNameValid,
                onChanged: (value) {
                  viewModel.validateBasicDetails();
                },
              ),
              20.height(),
              GestureDetector(
                onTap: () {
                  AppUtils.showCommonBottomSheet(context, 'date_of_birth');
                },
                child: ContainerWithLabel(
                  hintText: "Date of birth*",
                  selectedValue: viewModel.selectedDateOfBirth ?? "",
                  isValid: viewModel.isDateOfBirthValid,
                ),
              ),
              20.height(),
              GestureDetector(
                onTap: () {
                  AppUtils.showCommonBottomSheet(context, 'height');
                },
                child: ContainerWithLabel(
                  hintText: "Height*",
                  selectedValue: viewModel.selectedHeight ?? "",
                  isValid: viewModel.isHeightValid,
                ),
              ),
              20.height(),
              GestureDetector(
                onTap: () {
                  AppUtils.showCommonBottomSheet(context, 'address');
                },
                child: ContainerWithLabel(
                  hintText: "Address*",
                  selectedValue: viewModel.fullAddress ?? "",
                  isValid: viewModel.isAddressValid,
                ),
              ),
              10.height(),
              const Text(
                "Do you live with your family?",
                style: AppTextStyles.caption,
              ),
              10.height(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomButton(
                    text: "Yes",
                    onPressed: () {
                      context.read<AuthViewModel>().setIsLivedWithFamily(false);
                    },
                    borderRadius: 15.0,
                    buttonColor: !viewModel.isLivedWithFamily
                        ? AppColors.primary
                        : AppColors.white,
                    border: Border.all(
                      color: !viewModel.isLivedWithFamily
                          ? AppColors.primary
                          : AppColors.lightGrey,
                    ),
                    textColor: !viewModel.isLivedWithFamily
                        ? AppColors.white
                        : AppColors.darkGrey,
                    width: context.screenWidth * 0.3,
                    height: 35.0,
                  ),
                  30.width(),
                  CustomButton(
                    text: "No",
                    onPressed: () {
                      context.read<AuthViewModel>().setIsLivedWithFamily(true);
                    },
                    borderRadius: 15.0,
                    buttonColor: viewModel.isLivedWithFamily
                        ? AppColors.primary
                        : AppColors.white,
                    border: Border.all(
                      color: viewModel.isLivedWithFamily
                          ? AppColors.primary
                          : AppColors.lightGrey,
                    ),
                    textColor: viewModel.isLivedWithFamily
                        ? AppColors.white
                        : AppColors.darkGrey,
                    width: context.screenWidth * 0.3,
                    height: 35.0,
                  ),
                ],
              ),
              20.height(),
              !viewModel.isLivedWithFamily
                  ? const SizedBox.shrink()
                  : GestureDetector(
                      onTap: () {
                        AppUtils.showCommonBottomSheet(context, 'address2');
                      },
                      child: ContainerWithLabel(
                        hintText: "Where does your family live*",
                        selectedValue: viewModel.fullAddress2 ?? "",
                        isValid: true,
                      ),
                    ),
              10.height(),
              CustomButton(
                text: "Logout",
                onPressed: () {
                  AppUtils.showMyDialog(
                      "Logout", "Are you sure want to logout", context);
                },
                borderRadius: 5.0,
                buttonColor: AppColors.extraLightGrey,
                textColor: AppColors.darkGrey,
                width: context.screenWidth * 0.15,
                height: 30.0,
              ),
            ],
          ),
        );
      }),
    );
  }
}
