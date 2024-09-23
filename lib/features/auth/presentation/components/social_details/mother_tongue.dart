import 'package:flutter/material.dart';
import 'package:nikah_forever_assignment/core/common_widgets/selectable_widget.dart';
import 'package:nikah_forever_assignment/core/constants/app_text_style.dart';
import 'package:nikah_forever_assignment/features/auth/view_model/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class MotherTongueSelection extends StatelessWidget {
  const MotherTongueSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder: (context, viewModel, child) { 
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Select Mother Tongue", style: AppTextStyles.heading1),
            ListView.builder(
              itemCount: viewModel.motherTongueList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                String tongue = viewModel.motherTongueList[index];
                bool isSelected = viewModel.selectedMotherTongue == tongue;
                return SelectableItem(
                  item: tongue,
                  isSelected: isSelected,
                  onTap: () {
                    viewModel.updateSelectedMotherTongue(tongue);
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
