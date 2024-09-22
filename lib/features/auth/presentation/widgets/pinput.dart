import 'package:flutter/material.dart';
import 'package:nikah_forever_assignment/core/extensions/app_extensions.dart';
import 'package:pinput/pinput.dart';

class PinInputExample extends StatelessWidget {
  const PinInputExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: context.screenWidth * 0.8,
        child: Pinput(
          length: 4,
          onChanged: (value) {},
          focusedPinTheme: const PinTheme(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.blue,
                  width: 2,
                ),
              ),
            ),
          ),
          submittedPinTheme: const PinTheme(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.green,
                  width: 2,
                ),
              ),
            ),
          ),
          defaultPinTheme: const PinTheme(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
            ),
          ),
          pinAnimationType: PinAnimationType.scale,
        ),
      ),
    );
  }
}
