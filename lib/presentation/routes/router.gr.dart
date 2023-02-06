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

import '../../domain/quotes/quotes.dart' as _i5;
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
      final args = routeData.argsAs<QuoteScreenRouteArgs>();
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.QuoteScreen(
          key: args.key,
          quote: args.quote,
        ),
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
class QuoteScreenRoute extends _i3.PageRouteInfo<QuoteScreenRouteArgs> {
  QuoteScreenRoute({
    _i4.Key? key,
    required _i5.Result quote,
  }) : super(
          QuoteScreenRoute.name,
          path: '/quote-screen',
          args: QuoteScreenRouteArgs(
            key: key,
            quote: quote,
          ),
        );

  static const String name = 'QuoteScreenRoute';
}

class QuoteScreenRouteArgs {
  const QuoteScreenRouteArgs({
    this.key,
    required this.quote,
  });

  final _i4.Key? key;

  final _i5.Result quote;

  @override
  String toString() {
    return 'QuoteScreenRouteArgs{key: $key, quote: $quote}';
  }
}
