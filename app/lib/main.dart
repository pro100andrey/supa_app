import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:localization/localization.dart';
import 'package:logging/logging.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app/data/common/logger_init.dart';
import 'app/ui/snack/snack.dart';
import 'app/ui/theme/themes.dart';
import 'app/routes/app_pages.dart';
import 'app/services/config_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Get.putAsync(
    () async => ConfigService().init(),
  );

  setupRootLogger(isDebugMode: kDebugMode);

  final logger = Logger('root');

  FlutterError.onError = (details) {
    logger.severe(details.exceptionAsString());
    warningToast(details.exceptionAsString());
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    logger.shout(error.toString());
    warningToast(error.toString());
    return true;
  };

  await Supabase.initialize(
    url: ConfigService.to.url,
    anonKey: ConfigService.to.anonKey,
  );

  runApp(
    GetMaterialApp(
      title: 'Application',
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    ),
  );
}
