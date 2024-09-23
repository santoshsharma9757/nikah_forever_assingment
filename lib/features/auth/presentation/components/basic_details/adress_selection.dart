import 'package:flutter/material.dart';
import 'package:nikah_forever_assignment/core/common_widgets/selectable_widget.dart';
import 'package:nikah_forever_assignment/core/constants/app_text_style.dart';
import 'package:nikah_forever_assignment/features/auth/view_model/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class AddressSelection extends StatefulWidget {
  const AddressSelection({super.key});

  @override
  State<AddressSelection> createState() => _AddressSelectionState();
}

class _AddressSelectionState extends State<AddressSelection> {
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
                    viewModel.countryList,
                    viewModel.selectedCountry,
                    (value) {
                      viewModel.updateSelectedCountry(value);
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    "Country",
                  ),
                  _buildListView(
                    context,
                    viewModel.getStateListForCountry(
                        viewModel.selectedCountry ?? ''),
                    viewModel.selectedState,
                    (value) {
                      viewModel.updateSelectedState(value);
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    "State",
                  ),
                  _buildListView(
                    context,
                    viewModel
                        .getCityListForState(viewModel.selectedState ?? ''),
                    viewModel.selectedCity,
                    (value) {
                      viewModel.updateSelectedCity(value);
                      Navigator.pop(context);
                    },
                    "City",
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
        Text("Select $title*", style: AppTextStyles.heading1),
        ListView.builder(
          shrinkWrap: true,
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
      ],
    );
  }
}
