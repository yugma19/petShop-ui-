import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'domain/core/configs/app_config.dart';
import 'domain/core/configs/injection.dart';
import 'domain/core/services/navigation_services/navigation_service.dart';
import 'domain/core/services/navigation_services/routers/route_name.dart';
import 'domain/core/services/navigation_services/routers/routing_config.dart';

class MainApp extends StatelessWidget with WidgetsBindingObserver {
  @override
  MainApp({super.key}) {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConfig.of(context)!.appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'IBMPlexSans',
        primaryColor: const Color(0xFF111827),
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        colorScheme: ThemeData().colorScheme.copyWith(
            primary: const Color(0xFF111827),
            secondary: const Color(0XFF1F2937),
            tertiary: const Color(0xFF6B7280),
            background: const Color(0xFFFEF3C7),
            onTertiary: const Color(0xFFD97706),
            onTertiaryContainer: const Color(0xFFEF4444),
            onBackground: const Color(0xFFD1FAE5),
            tertiaryContainer: const Color(0xFF059669),
            surface: const Color(0xFFFFFFFF),
            surfaceTint: const Color(0xFFE5E7EB),
            onPrimary: const Color(0xFF9CA3AF),
            onSecondary: const Color(0xFFEB5757),
            secondaryContainer: const Color(0xFF374151),
            onSecondaryContainer: const Color(0xFFDC2626),
            onPrimaryContainer: const Color(0xFF242C32),
            onSurfaceVariant: const Color(0xFF059669)),
      ),
      builder: (context, child) => child!,
      navigatorKey: navigator<NavigationService>().navigatorKey,
      onGenerateRoute: Provider.of<AppStateNotifier>(context).isAuthorized
          ? authorizedNavigation
          : commonNavigation,
      initialRoute: Provider.of<AppStateNotifier>(context).isAuthorized
          ? UserRoutes.homeRoute
          : UserRoutes.homeRoute,
    );
  }
}

Future appInitializer(AppConfig appConfig) async {
  final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  AppStateNotifier appStateNotifier = AppStateNotifier(isAuthorized: false);

  final AppConfig configuredApp = AppConfig(
    serverUrl: appConfig.serverUrl,
    appTitle: appConfig.appTitle,
    buildFlavor: appConfig.buildFlavor,
    child: ChangeNotifierProvider<AppStateNotifier>(
      create: (context) {
        return appStateNotifier;
      },
      child: ResponsiveSizer(
        builder: (context, orientation, deviceType) {
          return MainApp();
        },
      ),
    ),
  );

  setupLocator(navKey, appStateNotifier);
  return runApp(configuredApp);
}
