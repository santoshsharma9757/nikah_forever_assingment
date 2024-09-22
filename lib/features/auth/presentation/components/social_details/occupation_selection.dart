import 'package:flutter/material.dart';
import 'package:nikah_forever_assignment/core/common_widgets/selectable_widget.dart';
import 'package:nikah_forever_assignment/core/constants/app_text_style.dart';
import 'package:nikah_forever_assignment/features/auth/view_model/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class OccupationSelection extends StatefulWidget {
  const OccupationSelection({super.key});

  @override
  _OccupationSelectionState createState() => _OccupationSelectionState();
}

class _OccupationSelectionState extends State<OccupationSelection> {
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
                  _buildOccupationTypeListView(viewModel),
                  if (viewModel.selectedOccupationType != null)
                    _buildOccupationDetailListView(viewModel),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildOccupationTypeListView(AuthViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Select Occupation Type", style: AppTextStyles.heading1),
        Expanded(
          child: ListView.builder(
            itemCount: viewModel.occupationData.keys.length,
            itemBuilder: (context, index) {
              String type = viewModel.occupationData.keys.elementAt(index);
              bool isSelected = viewModel.selectedOccupationType == type;
              return SelectableItem(
                item: type,
                isSelected: isSelected,
                onTap: () {
                  viewModel.updateSelectedOccupationType(type);
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

  Widget _buildOccupationDetailListView(AuthViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Select Occupation Detail", style: AppTextStyles.heading1),
        Expanded(
          child: ListView.builder(
            itemCount: viewModel.getOccupationDetailsForType(viewModel.selectedOccupationType!).length,
            itemBuilder: (context, index) {
              String detail = viewModel
                  .getOccupationDetailsForType(viewModel.selectedOccupationType!)
                  .elementAt(index);
              bool isSelected = viewModel.selectedOccupationDetail == detail;
              return SelectableItem(
                item: detail,
                isSelected: isSelected,
                onTap: () {
                  viewModel.updateSelectedOccupationDetail(detail);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
