import 'dart:async';

import 'package:flutter/material.dart';
import 'package:queue/src/app_widget.dart' deferred as app;

import 'firebase_setup.dart' deferred as fb;

Future<void> main() async {
  await fb.loadLibrary();
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await fb.firebaseSetup();

    await app.loadLibrary();
    runApp(app.AppWidget());
  }, fb.logOnFirebase);
}
