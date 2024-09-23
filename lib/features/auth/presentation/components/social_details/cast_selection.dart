import 'package:flutter/material.dart';
import 'package:nikah_forever_assignment/core/common_widgets/selectable_widget.dart';
import 'package:nikah_forever_assignment/core/constants/app_text_style.dart';
import 'package:nikah_forever_assignment/features/auth/view_model/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class SectAndCasteSelection extends StatefulWidget {
  const SectAndCasteSelection({super.key});

  @override
  _SectAndCasteSelectionState createState() => _SectAndCasteSelectionState(); 
}

class _SectAndCasteSelectionState extends State<SectAndCasteSelection> {
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
                  _buildListView(
                    context,
                    viewModel.sectData.keys.toList(),
                    viewModel.selectedSect,
                    (value) {
                      viewModel.updateSelectedSect(value);
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    "Sect",
                  ),
                  if (viewModel.selectedSect != null)
                    _buildListView(
                      context,
                      viewModel.getCasteListForSect(viewModel.selectedSect!),
                      viewModel.selectedCaste,
                      (value) {
                        viewModel.updateSelectedCaste(value);
                      },
                      "Caste",
                    ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildListView(BuildContext context, List<String> items,
      String? selectedItem, Function(String) onTap, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Select $title", style: AppTextStyles.heading1),
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              String item = items[index];
              bool isSelected = selectedItem == item;
              return SelectableItem(
                item: item,
                isSelected: isSelected,
                onTap: () => onTap(item),
              );
            },
          ),
        ),
      ],
    );
  }
}
