import 'package:intl/intl.dart';

String formattedDate(DateTime dateTime) {
  var format = DateFormat('dd-MMM-yyyy');
  var dateString = format.format(dateTime);
  return dateString;
}
