import 'package:fimber/fimber.dart';
import 'package:flutter_architecture/config/build_config.dart';

abstract class Logger {
  void d(String tag, String msg);
}

class LoggerImpl implements Logger {
  var taggedLoggers = Map<String, FimberLog>();

  LoggerImpl() {
    if (isDebug) {
      Fimber.plantTree(DebugTree());
    }
  }

  @override
  void d(String tag, String msg) {
    if (taggedLoggers.containsKey(tag)) {
      taggedLoggers[tag].d(msg);
    } else {
      Fimber.withTag(tag, (logger) {
        taggedLoggers[tag] = logger;
        logger.d(msg);
      });
    }
  }
}
