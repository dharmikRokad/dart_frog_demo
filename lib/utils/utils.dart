/// Utility class
class Utils {
  /// Singletone constuctor
  factory Utils() => _instance;

  Utils._();

  static final Utils _instance = Utils._();

  /// parse given string to Int
  int? parseInt(String strInt) {
    return int.tryParse(strInt);
  }
}
