// ignore_for_file: prefer_const_constructors

import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'features/auth/data/authentication_repository.dart';
import 'features/auth/presentation/view/login_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(AuthenticationRepository());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(
      // Enable DevicePreview only in debug mode
      kDebugMode
          ? DevicePreview(
              enabled: true,
              builder: (context) => MyApp(), // Wrap your app
            )
          : MyApp(), // Run your app normally in release mode
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        locale: const Locale('ar'),
        home: logIn());
  }
}
