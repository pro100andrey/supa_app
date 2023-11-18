import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app/data/common/logger_init.dart';
import 'app/routes/app_pages.dart';
import 'app/services/config_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(
    () async => ConfigService().init(),
  );
  loggerInit(isDebug: ConfigService.to.isDebug);

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
    ),
  );
}
