import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
// ignore: depend_on_referenced_packages
import 'package:injectable/injectable.dart';
import '../services/navigation_services/navigation_service.dart';

final getIt = GetIt.instance;

@InjectableInit(
  preferRelativeImports: false,
)
void configureInjection() => $initGetIt(getIt);

class $initGetIt {
  $initGetIt(GetIt getIt);
}

GetIt navigator = GetIt.instance;

void setupLocator(GlobalKey<NavigatorState> navKey) {
  navigator.registerFactory(() => NavigationService(navKey));
}
