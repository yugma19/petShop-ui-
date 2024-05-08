import 'package:flutter/material.dart';

class AppStateNotifier extends ChangeNotifier {
  bool isAuthorized;

  AppStateNotifier({
    required this.isAuthorized,
  });

  Future<void> updateAfterAuthChange({
    required bool isAuthorized,
  }) async {
    this.isAuthorized = isAuthorized;

    notifyListeners();
  }

  Future<void> notifyState() async {
    notifyListeners();
  }
}

class AppConfig extends InheritedWidget {
  final String appTitle;
  final String buildFlavor;
  final String appUrl;

  @override
  // ignore: overridden_fields
  final Widget child;

  const AppConfig({
    Key? key,
    required this.appUrl,
    required this.appTitle,
    required this.buildFlavor,
    required this.child,
  }) : super(key: key, child: child);

  static AppConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
