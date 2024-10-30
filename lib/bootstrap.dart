import 'dart:async';
import 'dart:developer';

import 'package:dak_app/utils/utils_export.dart';
import 'package:flutter/widgets.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();
   FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await RemoteConfigService().initConfig();
  await HiveCacheClient.initializeCache();
  await LocalStorageDb.init();
  runApp(await builder());
}
