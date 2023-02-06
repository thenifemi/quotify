import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../application/quotes/quotes_bloc.dart';
import '../../domain/quotes/quotes.dart';
import '../core/theme.dart';
import 'widgets/build_buttons_widget.dart';
import 'widgets/build_quote_widget.dart';

class QuoteScreen extends HookWidget {
  const QuoteScreen({super.key, required this.quote});

  final Result quote;

  @override
  Widget build(BuildContext context) {
    final isEditing = useState<bool>(false);
    final textController = useTextEditingController(text: quote.content);

    return BlocBuilder<QuotesBloc, QuotesState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            title: AutoSizeText(
              "📜 Quotify",
              style: themeData.textTheme.titleLarge,
            ),
          ),
          body: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                buildQuote(
                  isEditing,
                  textController,
                  quote,
                ),
                const SizedBox(height: 10),
                buildButtons(
                  isEditing,
                  textController,
                  quote,
                  context,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
