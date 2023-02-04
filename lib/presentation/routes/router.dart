import 'package:auto_route/auto_route.dart';

import '../home/home_screen.dart';
import '../home/quote_screen.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: HomeScreen, initial: true),
    MaterialRoute(page: QuoteScreen),
  ],
)
class $AppRouter {}
