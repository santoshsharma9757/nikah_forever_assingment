import 'package:flutter/material.dart';
import 'package:nikah_forever_assignment/core/constants/app_style.dart';
import 'package:nikah_forever_assignment/core/extensions/app_extensions.dart';
import 'package:nikah_forever_assignment/features/auth/presentation/components/basic_details/adress_selection.dart';
import 'package:nikah_forever_assignment/features/auth/presentation/components/basic_details/adress_selection2.dart';
import 'package:nikah_forever_assignment/features/auth/presentation/components/basic_details/date_picker_selection.dart';
import 'package:nikah_forever_assignment/features/auth/presentation/components/basic_details/height_selection.dart';

class CommonBottomSheetBasicDetails extends StatelessWidget {
  final String contentKey;
  const CommonBottomSheetBasicDetails({super.key, required this.contentKey});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                  width: 100,
                  height: 7,
                  decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.circular(5)))),
          10.height(),
          _buildContent(context),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    switch (contentKey) {
      case 'date_of_birth':
        return const DatePickerSelection(); 
      case 'height':
        return const HeightSelection();
      case 'address':
        return const AddressSelection();
      case 'address2':
        return const AddressSelection2();
      default:
        return _defaultContent();
    }
  }

  Widget _defaultContent() {
    return const Text('No content available for the given key.');
  }
}
