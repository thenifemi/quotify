import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../core/theme.dart';
import 'widgets/all_quotes_widget.dart';
import 'widgets/favorite_quote_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AutoSizeText(
          "📜 Quotify",
          style: themeData.textTheme.titleLarge,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: const [
            FavoriteQuoteWidget(),
            SizedBox(height: 20),
            AllQuotesWidget(),
          ],
        ),
      ),
    );
  }
}
