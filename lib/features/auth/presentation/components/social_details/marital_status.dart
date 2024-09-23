import 'package:flutter/material.dart';
import 'package:nikah_forever_assignment/core/common_widgets/selectable_widget.dart';
import 'package:nikah_forever_assignment/core/constants/app_text_style.dart';
import 'package:nikah_forever_assignment/features/auth/view_model/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class MaritalStatusSelection extends StatelessWidget {
  const MaritalStatusSelection({super.key});

  @override
  Widget build(BuildContext context) { 
    return Consumer<AuthViewModel>(
      builder: (context, viewModel, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Select Marital Status", style: AppTextStyles.heading1),
            ListView.builder(
              itemCount: viewModel.maritalStatusList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                String status = viewModel.maritalStatusList[index];
                bool isSelected = viewModel.selectedMaritalStatus == status;
                return SelectableItem(
                  item: status,
                  isSelected: isSelected,
                  onTap: () {
                    viewModel.updateSelectedMaritalStatus(status);
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
