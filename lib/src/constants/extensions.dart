import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String todMonthYear() {
    return DateFormat('d _ MMMM y', 'es_ES')
        .format(this)
        .replaceFirst('_', 'de');
  }
}
