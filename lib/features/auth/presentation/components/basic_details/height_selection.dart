import 'package:flutter/material.dart';
import 'package:nikah_forever_assignment/core/common_widgets/selectable_widget.dart';
import 'package:nikah_forever_assignment/core/constants/app_text_style.dart';
import 'package:nikah_forever_assignment/features/auth/view_model/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class HeightSelection extends StatelessWidget {
  const HeightSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder: (context, viewModel, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Select Height*", style: AppTextStyles.heading1),
            ListView.builder(
              itemCount: viewModel.heightList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                String height = viewModel.heightList[index];
                bool isSelected = viewModel.selectedHeight == height;
                return SelectableItem(
                  item: height,
                  isSelected: isSelected,
                  onTap: () {
                    viewModel.updateSelectedHeight(height);
                     Navigator.pop(context);
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
