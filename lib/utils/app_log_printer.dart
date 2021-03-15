import 'package:logger/logger.dart';

class AppLogPrinter extends LogPrinter {
  final String className;
  AppLogPrinter(this.className);

  @override
  void log(Level level, message, error, StackTrace stackTrace) {
    var color = PrettyPrinter.levelColors[level];
    var emoji = PrettyPrinter.levelEmojis[level];
    println(color('$emoji $className - $message'));
  }
}

Logger getLogger(String className) {
  return Logger(printer: AppLogPrinter(className));
}
