import 'package:ebuy/data/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'data/repositories/authentication_repository.dart';
import 'firebase_options.dart';

Future <void> main() async {
  /// __ Add Widget Binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  /// __ Init Local storage
  await GetStorage.init();

  /// __ Await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// Initialize Firebase and Authentication
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
          (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );

  /// Initialize UserRepository
  Get.put(UserRespository());

  /// Load all the Material Design / Theme / Localization / Bindings.
  runApp(const MyApp());
}



