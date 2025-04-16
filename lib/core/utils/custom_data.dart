import 'package:intl/intl.dart';

class CustomData {
  static String dateTimeToDateBr(DateTime dateTime) {
    DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    return dateFormat.format(dateTime);
  }

  static String dateTimeToHourBr(DateTime dateTime) {
    DateFormat dateFormat = DateFormat('HH:mm');
    return dateFormat.format(dateTime);
  }
}
