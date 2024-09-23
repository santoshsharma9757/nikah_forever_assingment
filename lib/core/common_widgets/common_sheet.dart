import 'package:flutter/material.dart';
import 'package:nikah_forever_assignment/features/auth/presentation/widgets/multi_seelct.dart';
import 'package:nikah_forever_assignment/features/auth/view_model/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class CommonBottomSheet extends StatefulWidget {
  final String contentKey;
  const CommonBottomSheet({super.key, required this.contentKey});

  @override
  State<CommonBottomSheet> createState() => _CommonBottomSheetState();
}

class _CommonBottomSheetState extends State<CommonBottomSheet> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder: (context, viewModel, child) {
        return Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                      width: 100,
                      height: 7,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(5)))),
              const SizedBox(height: 10),
              SizedBox(
                height: 300,
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: _buildContentList(viewModel),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _buildContentList(AuthViewModel viewModel) {
    return [
      // Marital Status Selection
      MultiStepSelection(
        title: "Select Marital Status",
        items: viewModel.maritalStatusList,
        onSelect: (value) {
          viewModel.updateSelectedMaritalStatus(value);
        },
        pageController: _pageController,
        selectedValue: viewModel.selectedMaritalStatus,
      ),

      // Mother Tongue Selection
      MultiStepSelection(
        title: "Select Mother Tongue",
        items: viewModel.motherTongueList,
        onSelect: (value) {
          viewModel.updateSelectedMotherTongue(value);
        },
        pageController: _pageController,
        selectedValue: viewModel.selectedMotherTongue,
      ),

      // Sect Selection
      MultiStepSelection(
        title: "Select Sect",
        items: viewModel.sectData.keys.toList(),
        onSelect: (value) {
          viewModel.updateSelectedSect(value);
        },
        pageController: _pageController,
        selectedValue: viewModel.selectedSect,
      ),

      // Caste Selection (Only show if a Sect is selected)
      if (viewModel.selectedSect != null)
        MultiStepSelection(
          title: "Select Caste",
          items: viewModel.getCasteListForSect(viewModel.selectedSect!),
          onSelect: (value) {
            viewModel.updateSelectedCaste(value);
          },
          pageController: _pageController,
          selectedValue: viewModel.selectedCaste,
        ),

      // Highest Education Selection
      MultiStepSelection(
        title: "Select Highest Education",
        items: Provider.of<AuthViewModel>(context).educationData.keys.toList(),
        onSelect: (value) {
          Provider.of<AuthViewModel>(context, listen: false)
              .updateSelectedEducationLevel(value);
        },
        pageController: _pageController,
        selectedValue:
            Provider.of<AuthViewModel>(context).selectedEducationLevel,
      ),

      // Specific Education Selection (Only show if an Education Level is selected)
      if (Provider.of<AuthViewModel>(context).selectedEducationLevel != null)
        MultiStepSelection(
          title: "Select Specific Education",
          items: Provider.of<AuthViewModel>(context).getEducationListForLevel(
              Provider.of<AuthViewModel>(context).selectedEducationLevel!),
          onSelect: (value) {
            Provider.of<AuthViewModel>(context, listen: false)
                .updateSelectedEducation(value);
          },
          pageController: _pageController,
          selectedValue: Provider.of<AuthViewModel>(context).selectedEducation,
        ),

      // Employment Type Selection
      MultiStepSelection(
        title: "Select Employment Type",
        items: Provider.of<AuthViewModel>(context).employmentData.keys.toList(),
        onSelect: (value) {
          Provider.of<AuthViewModel>(context, listen: false)
              .updateSelectedEmploymentType(value);
        },
        pageController: _pageController,
        selectedValue:
            Provider.of<AuthViewModel>(context).selectedEmploymentType,
      ),

      // Specific Employment Detail Selection (Only show if an Employment Type is selected)
      if (Provider.of<AuthViewModel>(context).selectedEmploymentType != null)
        MultiStepSelection(
          title: "Select Employment Detail",
          items: Provider.of<AuthViewModel>(context)
              .getEmploymentDetailsForType(
                  Provider.of<AuthViewModel>(context).selectedEmploymentType!),
          onSelect: (value) {
            Provider.of<AuthViewModel>(context, listen: false)
                .updateSelectedEmploymentDetail(value);
          },
          pageController: _pageController,
          selectedValue:
              Provider.of<AuthViewModel>(context).selectedEmploymentDetail,
        ),

      // Occupation Type Selection
      MultiStepSelection(
        title: "Select Occupation Type",
        items: Provider.of<AuthViewModel>(context).occupationData.keys.toList(),
        onSelect: (value) {
          Provider.of<AuthViewModel>(context, listen: false)
              .updateSelectedOccupationType(value);
        },
        pageController: _pageController,
        selectedValue:
            Provider.of<AuthViewModel>(context).selectedOccupationType,
      ),

      // Specific Occupation Detail Selection (Only show if an Occupation Type is selected)
      if (Provider.of<AuthViewModel>(context).selectedOccupationType != null)
        MultiStepSelection(
          title: "Select Occupation Detail",
          items: Provider.of<AuthViewModel>(context)
              .getOccupationDetailsForType(
                  Provider.of<AuthViewModel>(context).selectedOccupationType!),
          onSelect: (value) {
            Provider.of<AuthViewModel>(context, listen: false)
                .updateSelectedOccupationDetail(value);
          },
          pageController: _pageController,
          selectedValue:
              Provider.of<AuthViewModel>(context).selectedOccupationDetail,
        ),

      // Annual Income Range Selection
      MultiStepSelection(
        title: "Select Annual Income Range",
        items: viewModel.annualIncomeRangeList,
        onSelect: (value) {
          viewModel.updateSelectedAnnualIncomeRange(value);
        },
        pageController: _pageController,
        selectedValue: viewModel.selectedAnnualIncomeRange,
      ),

      // Additional selections can be added here if needed
    ];
  }
}
