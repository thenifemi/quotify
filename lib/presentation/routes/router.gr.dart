// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../home/home_screen.dart' as _i1;
import '../home/quote_screen.dart' as _i2;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    HomeScreenRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomeScreen(),
      );
    },
    QuoteScreenRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.QuoteScreen(),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          HomeScreenRoute.name,
          path: '/',
        ),
        _i3.RouteConfig(
          QuoteScreenRoute.name,
          path: '/quote-screen',
        ),
      ];
}

/// generated route for
/// [_i1.HomeScreen]
class HomeScreenRoute extends _i3.PageRouteInfo<void> {
  const HomeScreenRoute()
      : super(
          HomeScreenRoute.name,
          path: '/',
        );

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i2.QuoteScreen]
class QuoteScreenRoute extends _i3.PageRouteInfo<void> {
  const QuoteScreenRoute()
      : super(
          QuoteScreenRoute.name,
          path: '/quote-screen',
        );

  static const String name = 'QuoteScreenRoute';
}
