import 'package:intl/intl.dart';

class DateFormatterUtil {
  // Method to format date as 'dd-MM-yyyy'
  static String formatToDDMMYYYY(DateTime selectedDate) {
    return DateFormat('dd-MM-yyyy').format(selectedDate);
  }
}
