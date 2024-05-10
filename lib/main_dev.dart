// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pet_shop_ui/app.dart';
import 'package:pet_shop_ui/domain/core/configs/app_config.dart';
import 'package:pet_shop_ui/domain/core/configs/firebase_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final firebaseConfig = FirebaseConfig.fromJson({
    'apiKey': "AIzaSyBvU5f1oe9r53MLhjOtM78Rma2_Tg8p--g",
    'authDomain': "pet-shop-93c01.firebaseapp.com",
    'projectId': "pet-shop-93c01",
    'storageBucket': "pet-shop-93c01.appspot.com",
    'messagingSenderId': "356302856127",
    'appId': "1:356302856127:android:9f8edb67ecbf22b53a4b0a",
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
    appTitle: 'Pet-shop-D',
    serverUrl:
        'https://4151-2405-201-200b-4270-cc8c-9596-9d40-fa4d.ngrok-free.app///V3/mainRoute/',
    buildFlavor: 'dev',
    child: Container(),
  );

  appInitializer(appConfig);
}
