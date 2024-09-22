import 'package:flutter/material.dart';
import 'package:nikah_forever_assignment/core/common_widgets/selectable_widget.dart';
import 'package:nikah_forever_assignment/core/constants/app_text_style.dart';
import 'package:nikah_forever_assignment/features/auth/view_model/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class AnnualIncomeRangeSelection extends StatelessWidget {
  const AnnualIncomeRangeSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder: (context, viewModel, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Select Annual Income Range", style: AppTextStyles.heading1),
            ListView.builder(
              itemCount: viewModel.annualIncomeRangeList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                String range = viewModel.annualIncomeRangeList[index];
                bool isSelected = viewModel.selectedAnnualIncomeRange == range;
                return SelectableItem(
                  item: range,
                  isSelected: isSelected,
                  onTap: () {
                    viewModel.updateSelectedAnnualIncomeRange(range);
                  },
                );
              },
            ),
          ],
        );
      },
    );
  }
}
