import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pet_shop_ui/presentation/pages/home_page.dart';import '../../../../../domain/core/extensions/string_extension.dart';

import 'route_name.dart';

Route<dynamic> authorizedNavigation(RouteSettings settings) {
  final routingData = settings.name!.getRoutingData;

  switch (routingData.route) {
    case UserRoutes.HomeRoute:
      return _getPageRoute(Container(), settings);

    default:
      return commonNavigation(settings);
  }
}

Route<dynamic> commonNavigation(RouteSettings settings) {
  final routingData = settings.name!.getRoutingData;
  switch (routingData.route) {
    case UserRoutes.HomeRoute:
      return _getPageRoute(const HomePage(), settings);

    default:
      return _getPageRoute(
          Container(
            color: Colors.white,
          ),
          settings);
  }
}

PageRoute _getPageRoute(
  Widget child,
  RouteSettings settings, {
  bool mainRoute = false,
}) {
  if (kIsWeb) {
    return MaterialPageRoute(builder: (BuildContext context) => child);
  } else if (Platform.isIOS && !mainRoute) {
    return CupertinoPageRoute(builder: (BuildContext context) => child);
  } else {
    return MaterialPageRoute(builder: (BuildContext context) => child);
  }
}
