import 'package:logger/logger.dart';

/// Logger helper class
class Log {
  /// singltone constructor
  factory Log() => _instance;

  /// private constructor
  Log._()
      : _logger = Logger(
          printer: PrettyPrinter(),
        );

  static final _instance = Log._();

  /// logger object
  late final Logger _logger;

  ///
  void i(dynamic message) => _logger.i(message);

  ///
  void w(dynamic message) => _logger.w(message);

  ///
  void d(dynamic message) => _logger.d(message);

  ///
  void e(dynamic message) => _logger.e(message);

  ///
  void f(dynamic message) => _logger.f(message);
}
