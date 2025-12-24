import 'package:flutter/foundation.dart';

extension LoggingExtension on Object? {
  void get iLog {
    debugPrintThrottled("\x1B[33mLogger => ${toString()}\x1B[0m");
  }

  void get sLog {
    debugPrintThrottled("\x1B[32mLogger => ${toString()}\x1B[0m");
  }

  void get wLog {
    debugPrintThrottled("\x1B[34mLogger => ${toString()}\x1B[0m");
  }

  void get eLog {
    debugPrintThrottled("\x1B[31mLogger => ${toString()}\x1B[0m");
  }

  void get oLog {
    debugPrintThrottled("\x1B[36mLogger => ${toString()}\x1B[0m");
  }
}
