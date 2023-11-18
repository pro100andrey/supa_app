// ignore_for_file: avoid_positional_boolean_parameters

import 'dart:developer';
import 'package:logging/logging.dart';

void loggerInit({bool isDebug = false}) {
  Logger.root.level = isDebug ? Level.ALL : Level.OFF;
  if (!isDebug) {
    return;
  }

  Logger.root.onRecord.listen((record) {
    if (!isDebug) {
      return;
    }

    const reset = '\x1B[0m';
    const gray = '\x1b[90m';
    const white = '\x1B[0;37m';

    final colorLevel = <Level, String>{
      Level.SHOUT: '\x1B[0;101m',
      Level.SEVERE: '\x1B[1;31m',
      Level.WARNING: '\x1B[1;33m',
      Level.INFO: '\x1B[0;34m',
      Level.CONFIG: '\x1B[0;35m',
      Level.FINE: '\x1B[0;32m',
      Level.FINER: '\x1B[1;32m',
      Level.FINEST: '\x1B[0;102m',
    };

    final message =
        '$gray${record.time}$reset$white[${record.loggerName}-'
        '${record.level.name}]: $reset${colorLevel[record.level]}'
        '${record.message}$reset';

    log(
      message,
      time: record.time,
      name: record.loggerName,
      sequenceNumber: record.sequenceNumber,
      zone: record.zone,
      level: record.level.value,
      error: record.error,
      stackTrace: record.stackTrace,
    );
  });
}
