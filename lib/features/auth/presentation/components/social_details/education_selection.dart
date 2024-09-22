import 'package:flutter/material.dart';
import 'package:nikah_forever_assignment/core/common_widgets/selectable_widget.dart';
import 'package:nikah_forever_assignment/core/constants/app_text_style.dart';
import 'package:nikah_forever_assignment/features/auth/view_model/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class HighestEducationSelection extends StatefulWidget {
  const HighestEducationSelection({super.key});

  @override
  _HighestEducationSelectionState createState() => _HighestEducationSelectionState();
}

class _HighestEducationSelectionState extends State<HighestEducationSelection> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder: (context, viewModel, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildEducationLevelListView(viewModel),
                  if (viewModel.selectedEducationLevel != null)
                    _buildEducationListView(viewModel),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildEducationLevelListView(AuthViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Select Education Level", style: AppTextStyles.heading1),
        Expanded(
          child: ListView.builder(
            itemCount: viewModel.educationData.keys.length,
            itemBuilder: (context, index) {
              String level = viewModel.educationData.keys.elementAt(index);
              bool isSelected = viewModel.selectedEducationLevel == level;
              return SelectableItem(
                item: level,
                isSelected: isSelected,
                onTap: () {
                  viewModel.updateSelectedEducationLevel(level);
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildEducationListView(AuthViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Select Education", style: AppTextStyles.heading1),
        Expanded(
          child: ListView.builder(
            itemCount: viewModel.getEducationListForLevel(viewModel.selectedEducationLevel!).length,
            itemBuilder: (context, index) {
              String education = viewModel.getEducationListForLevel(viewModel.selectedEducationLevel!).elementAt(index);
              bool isSelected = viewModel.selectedEducation == education;
              return SelectableItem(
                item: education,
                isSelected: isSelected,
                onTap: () {
                  viewModel.updateSelectedEducation(education);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
