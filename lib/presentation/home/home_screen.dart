import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/quotes/quotes_bloc.dart';
import '../../injection.dart';
import '../core/theme.dart';
import 'widgets/all_quotes_widget.dart';
import 'widgets/favorite_quote_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<QuotesBloc>()..add(GetQuotes()),
      child: BlocBuilder<QuotesBloc, QuotesState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: AutoSizeText(
                "📜 Quotify",
                style: themeData.textTheme.titleLarge,
              ),
            ),
            body: Container(
              padding: const EdgeInsets.all(20),
              height: double.infinity,
              child: state.failureOrResponseOption.fold(
                () => Container(),
                (either) => either.fold(
                  (_) => Center(
                    child: AutoSizeText(
                      "😪 Uh oh! An error occurred!",
                      style: themeData.textTheme.bodyMedium,
                    ),
                  ),
                  (response) {
                    final hasFavQuote = response.results.any(
                      (quote) => quote.faved == true,
                    );

                    return Column(
                      children: [
                        hasFavQuote
                            ? FavoriteQuoteWidget(quotes: response)
                            : Container(),
                        AllQuotesWidget(quotes: response),
                      ],
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
