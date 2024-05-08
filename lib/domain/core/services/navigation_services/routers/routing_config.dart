import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_shop_ui/presentation/pages/home_page.dart';
import '../../../extensions/string_extension.dart';
import 'route_name.dart';

Route<dynamic> authorizedNavigation(RouteSettings settings) {
  final routingData = settings.name!.getRoutingData;

  switch (routingData.route) {
    case UserRoutes.homeRoute:
      return _getPageRoute(const HomePage(), settings);

    default:
      return commonNavigation(settings);
  }
}

Route<dynamic> commonNavigation(RouteSettings settings) {
  final routingData = settings.name!.getRoutingData;
  switch (routingData.route) {
    case UserRoutes.homeRoute:
      return _getPageRoute(const HomePage(), settings);

    default:
      return _getPageRoute(const Placeholder(), settings);
  }
}

PageRoute _getPageRoute(
  Widget child,
  RouteSettings settings, {
  bool mainRoute = false,
}) {
  if (Platform.isIOS && !mainRoute) {
    return CupertinoPageRoute(builder: (BuildContext context) => child);
  } else {
    return MaterialPageRoute(builder: (BuildContext context) => child);
  }
}
