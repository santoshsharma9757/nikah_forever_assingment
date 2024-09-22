import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import for date formatting
import 'package:nikah_forever_assignment/core/common_widgets/common_button.dart';
import 'package:nikah_forever_assignment/core/constants/app_style.dart';
import 'package:nikah_forever_assignment/core/constants/app_text_style.dart';
import 'package:nikah_forever_assignment/features/auth/view_model/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class DatePickerSelection extends StatefulWidget {
  const DatePickerSelection({super.key});

  @override
  _DatePickerSelectionState createState() => _DatePickerSelectionState();
}

class _DatePickerSelectionState extends State<DatePickerSelection> {
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AuthViewModel>().setSelectedDateOfBirth(
          DateFormat('dd-MM-yyyy').format(selectedDate));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Add Date of Birth", style: AppTextStyles.heading1),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.close,
                  color: AppColors.red,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: selectedDate,
                onDateTimeChanged: (DateTime newDate) {
                  setState(() {
                    selectedDate = newDate;
                    context.read<AuthViewModel>().setSelectedDateOfBirth(
                        DateFormat('dd-MM-yyyy').format(selectedDate));
                  });
                },
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          confirmButtons()
        ],
      ),
    );
  }

  Widget confirmButtons() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomButton(
          text: "Confirm",
          onPressed: () {
            Navigator.pop(context);
          },
          borderRadius: 15.0,
          padding: AppPadding.small,
          buttonColor: AppColors.primary,
          textColor: Colors.white,
          width: double.infinity,
          height: 45.0,
        ),
      ),
    );
  }
}
