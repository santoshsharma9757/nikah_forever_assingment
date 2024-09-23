import 'package:flutter/material.dart';
import 'package:nikah_forever_assignment/features/auth/presentation/components/social_details/multi_selection.dart';
import 'package:nikah_forever_assignment/features/auth/view_model/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class CommonBottomSheet extends StatefulWidget {
  final String contentKey;
  const CommonBottomSheet({super.key, required this.contentKey});

  @override
  State<CommonBottomSheet> createState() => _CommonBottomSheetState();
}

class _CommonBottomSheetState extends State<CommonBottomSheet> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    final viewModel = Provider.of<AuthViewModel>(context, listen: false);
    _pageController = PageController(initialPage: viewModel.currentPageIndex);
  }

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
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 300,
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (index) {
                    viewModel.currentPageIndex = index;
                  },
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
      MultiStepSelection(
        title: "Select Marital Status*",
        items: viewModel.maritalStatusList,
        onSelect: (value) {
          viewModel.updateSelectedMaritalStatus(value);
        },
        pageController: _pageController,
        selectedValue: viewModel.selectedMaritalStatus,
      ),
      MultiStepSelection(
        title: "Select Mother Tongue*",
        items: viewModel.motherTongueList,
        onSelect: (value) {
          viewModel.updateSelectedMotherTongue(value);
        },
        pageController: _pageController,
        selectedValue: viewModel.selectedMotherTongue,
      ),
      MultiStepSelection(
        title: "Select Sect*",
        items: viewModel.sectData.keys.toList(),
        onSelect: (value) {
          viewModel.updateSelectedSect(value);
        },
        pageController: _pageController,
        selectedValue: viewModel.selectedSect,
      ),
      if (viewModel.selectedSect != null)
        MultiStepSelection(
          title: "Select Caste*",
          items: viewModel.getCasteListForSect(viewModel.selectedSect!),
          onSelect: (value) {
            viewModel.updateSelectedCaste(value);
          },
          pageController: _pageController,
          selectedValue: viewModel.selectedCaste,
        ),
      MultiStepSelection(
        title: "Select Highest Education*",
        items: viewModel.educationData.keys.toList(),
        onSelect: (value) {
          viewModel.updateSelectedEducationLevel(value);
        },
        pageController: _pageController,
        selectedValue: viewModel.selectedEducationLevel,
      ),
      if (viewModel.selectedEducationLevel != null)
        MultiStepSelection(
          title: "Select Specific Education*",
          items: viewModel.getEducationListForLevel(viewModel.selectedEducationLevel!),
          onSelect: (value) {
            viewModel.updateSelectedEducation(value);
          },
          pageController: _pageController,
          selectedValue: viewModel.selectedEducation,
        ),
      MultiStepSelection(
        title: "Select Employment Type*",
        items: viewModel.employmentData.keys.toList(),
        onSelect: (value) {
          viewModel.updateSelectedEmploymentType(value);
        },
        pageController: _pageController,
        selectedValue: viewModel.selectedEmploymentType,
      ),
      if (viewModel.selectedEmploymentType != null)
        MultiStepSelection(
          title: "Select Employment Detail*",
          items: viewModel.getEmploymentDetailsForType(viewModel.selectedEmploymentType!),
          onSelect: (value) {
            viewModel.updateSelectedEmploymentDetail(value);
          },
          pageController: _pageController,
          selectedValue: viewModel.selectedEmploymentDetail,
        ),
      MultiStepSelection(
        title: "Select Occupation Type*",
        items: viewModel.occupationData.keys.toList(),
        onSelect: (value) {
          viewModel.updateSelectedOccupationType(value);
        },
        pageController: _pageController,
        selectedValue: viewModel.selectedOccupationType,
      ),
      if (viewModel.selectedOccupationType != null)
        MultiStepSelection(
          title: "Select Occupation Detail*",
          items: viewModel.getOccupationDetailsForType(viewModel.selectedOccupationType!),
          onSelect: (value) {
            viewModel.updateSelectedOccupationDetail(value);
          },
          pageController: _pageController,
          selectedValue: viewModel.selectedOccupationDetail,
        ),
      MultiStepSelection(
        title: "Select Annual Income Range*",
        items: viewModel.annualIncomeRangeList,
        onSelect: (value) {
          viewModel.updateSelectedAnnualIncomeRange(value);
        },
        pageController: _pageController,
        selectedValue: viewModel.selectedAnnualIncomeRange,
      ),
    ];
  }
}
