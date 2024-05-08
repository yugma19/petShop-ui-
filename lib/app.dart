import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'domain/core/configs/app_config.dart';
import 'domain/core/configs/injection.dart';
import 'domain/core/services/navigation_services/navigation_service.dart';
import 'domain/core/services/navigation_services/routers/route_name.dart';
import 'domain/core/services/navigation_services/routers/routing_config.dart';

class CustomScrollingBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConfig.of(context)!.appTitle,
      scrollBehavior: CustomScrollingBehavior().copyWith(scrollbars: false),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Manrope',
          primaryColor: const Color(0xffBB9457),
          scaffoldBackgroundColor: const Color(0xFFFFFFFF),
          colorScheme: ThemeData().colorScheme.copyWith(
                tertiaryContainer: const Color(0xFF000000),
                primary: const Color(0xff432818),
                primaryContainer: const Color(0xff0D1756),
                onPrimary: const Color(0xffBB9457),
                background: const Color(0xffF2F4F7),
                onBackground: Color.fromARGB(255, 250, 250, 250),
                secondary: const Color(0xff21A546),
                secondaryContainer: const Color(0xff333333),
                onSecondary: const Color(0xffEFEFEF),
                tertiary: const Color(0xffF4EFE7),
                error: const Color(0xffE65A5A),
                onSurface: const Color(0xff48FF70),
                onTertiaryContainer: const Color(0xff4F4F4F),
                onTertiary: const Color(0xff747474),
                inversePrimary: const Color(0xFFD0F9E5),
                inverseSurface: const Color(0x1E48FF70),
                //onSurfaceVariant: const Color(0xff4F4F4F),
              )),
      builder: (context, child) => ResponsiveSizer(
        builder: (context, orientation, deviceType) {
          return child!;
        },
      ),
      navigatorKey: navigator<NavigationService>().navigatorKey,
      onGenerateRoute: Provider.of<AppStateNotifier>(context).isAuthorized
          ? commonNavigation
          : commonNavigation,
      initialRoute: Provider.of<AppStateNotifier>(context).isAuthorized
          ? UserRoutes.HomeRoute
          : UserRoutes.HomeRoute,
    );
  }
}

Future appInitializer(AppConfig appConfig) async {
  AppStateNotifier appStateNotifier = AppStateNotifier(
    isAuthorized: true,
  );
  final AppConfig configuredApp = AppConfig(
    appTitle: appConfig.appTitle,
    buildFlavor: appConfig.buildFlavor,
    appUrl: appConfig.appUrl,
    child: ChangeNotifierProvider<AppStateNotifier>(
      create: (context) {
        return appStateNotifier;
      },
      child: const MainApp(),
    ),
  );
  setupLocator(GlobalKey<NavigatorState>());
  return runApp(
    configuredApp,
  );
}
