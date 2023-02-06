import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import '../../application/quotes/quotes_bloc.dart';
import '../../injection.dart';
import '../core/theme.dart';
import '../routes/router.gr.dart';

class App extends HookWidget {
  App({super.key});

  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

    return BlocProvider(
      create: (context) => getIt<QuotesBloc>()..add(GetQuotes()),
      child: MaterialApp.router(
        title: 'Quotify',
        theme: themeData,
        debugShowCheckedModeBanner: false,
        routeInformationParser: appRouter.defaultRouteParser(),
        routerDelegate: appRouter.delegate(),
      ),
    );
  }
}
