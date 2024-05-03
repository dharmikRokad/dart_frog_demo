import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:intl/intl.dart';

/// Extension on String
extension HashValueExt on String {
  /// return unoque id
  String get hashValue => sha256.convert(utf8.encode(this)).toString();
}

///
extension DateTimeExtension on String {
  ///
  DateTime? get toDateTime {
    final dateFormate = DateFormat('dd/MM/yyyy');
    return dateFormate.parse(this);
  }
}
