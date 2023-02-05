import 'package:hive/hive.dart';

import 'domain/quotes/quotes.dart';

void registerAdapters() {
  Hive.registerAdapter(QuotesAdapter());
  Hive.registerAdapter(ResultAdapter());
}
