import 'package:intl/intl.dart';

/// DateTime -> String Extension
extension StringExtension on DateTime {
  /// Formatte dString with dd-mm-yyyy
  String get ddMMyyyy {
    final formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(this);
  }
}
