import 'package:flutter/material.dart';
import 'package:nikah_forever_assignment/core/common_widgets/selectable_widget.dart';
import 'package:nikah_forever_assignment/core/constants/app_text_style.dart';
import 'package:nikah_forever_assignment/features/auth/view_model/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class EmploymentSelection extends StatefulWidget {
  const EmploymentSelection({super.key});

  @override
  _EmploymentSelectionState createState() => _EmploymentSelectionState();
}

class _EmploymentSelectionState extends State<EmploymentSelection> {
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
                  _buildEmploymentTypeListView(viewModel),
                  if (viewModel.selectedEmploymentType != null)
                    _buildEmploymentDetailListView(viewModel),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildEmploymentTypeListView(AuthViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Select Employment Type", style: AppTextStyles.heading1),
        Expanded(
          child: ListView.builder(
            itemCount: viewModel.employmentData.keys.length,
            itemBuilder: (context, index) {
              String type = viewModel.employmentData.keys.elementAt(index);
              bool isSelected = viewModel.selectedEmploymentType == type;
              return SelectableItem(
                item: type,
                isSelected: isSelected,
                onTap: () {
                  viewModel.updateSelectedEmploymentType(type);
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

  Widget _buildEmploymentDetailListView(AuthViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Select Employment Detail", style: AppTextStyles.heading1),
        Expanded(
          child: ListView.builder(
            itemCount: viewModel.getEmploymentDetailsForType(viewModel.selectedEmploymentType!).length,
            itemBuilder: (context, index) {
              String detail = viewModel
                  .getEmploymentDetailsForType(viewModel.selectedEmploymentType!)
                  .elementAt(index);
              bool isSelected = viewModel.selectedEmploymentDetail == detail;
              return SelectableItem(
                item: detail,
                isSelected: isSelected,
                onTap: () {
                  viewModel.updateSelectedEmploymentDetail(detail);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
