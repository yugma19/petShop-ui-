import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pet_shop_ui/domain/core/configs/app_config.dart';
import 'package:pet_shop_ui/domain/core/configs/firebase_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final firebaseConfig = FirebaseConfig.fromJson({
    'apiKey': "AIzaSyD8E0o3_rS0WZODilTLfyWGLYVdXaI1VNg",
    'authDomain': "pet-shop-93c01.firebaseapp.com",
    'projectId': "pet-shop-93c01",
    'storageBucket': "pet-shop-93c01.appspot.com",
    'messagingSenderId': "356302856127",
    'appId': "1:356302856127",
  });

  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: firebaseConfig.apiKey,
    authDomain: firebaseConfig.authDomain,
    projectId: firebaseConfig.projectId,
    storageBucket: firebaseConfig.storageBucket,
    messagingSenderId: firebaseConfig.messagingSenderId,
    appId: firebaseConfig.appId,
  ));
  final appConfig = AppConfig(
    appTitle: 'Pet-shop',
    appUrl:
        'https://6d38-2405-201-200b-4270-d515-766a-c086-2030.ngrok-free.app/V3/mainRoute/',
    buildFlavor: 'production',
    child: Container(),
  );
  runApp(appConfig);
}
