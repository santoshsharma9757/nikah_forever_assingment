import 'package:flutter/material.dart';
import 'package:nikah_forever_assignment/core/common_widgets/selectable_widget.dart';
import 'package:nikah_forever_assignment/core/constants/app_text_style.dart';

class MultiStepSelection extends StatefulWidget {
  final String title;
  final List<String> items;
  final Function(String) onSelect;
  final PageController pageController;
  final String? selectedValue;

  const MultiStepSelection({
    super.key,
    required this.title,
    required this.items,
    required this.onSelect,
    required this.pageController,
    this.selectedValue,
  });

  @override
  State<MultiStepSelection> createState() => _MultiStepSelectionState();
}

class _MultiStepSelectionState extends State<MultiStepSelection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: AppTextStyles.heading1),
        Expanded(
          child: ListView.builder(
            itemCount: widget.items.length,
            itemBuilder: (context, index) {
              String item = widget.items[index];
              bool isSelected = widget.selectedValue == item;
              return SelectableItem(
                item: item,
                isSelected: isSelected,
                onTap: () {
                  widget.onSelect(item);
                  widget.pageController.nextPage(
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
}
