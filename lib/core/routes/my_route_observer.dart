import 'package:flutter/material.dart';
import 'package:v2ray_vpn/core/logging/logger.dart';

class MyRouteObserver extends NavigatorObserver {

  MyRouteObserver(this._logger);

  final Logger _logger;


  @override
  void didPush(Route route, Route? previousRoute) {
    _logger.d('DidPush route: ${route.settings.name} ^^ Previous route: ${previousRoute?.settings.name}');
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    _logger.d('DidPop route: ${route.settings.name} ^^ Previous route: ${previousRoute?.settings.name}');
    super.didPop(route, previousRoute);
  }
}
