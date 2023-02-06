part of 'quotes_bloc.dart';

@immutable
abstract class QuotesEvent {}

class GetQuotes extends QuotesEvent {
  GetQuotes({required this.resetQuotes});

  final bool resetQuotes;
}

class FavQuote extends QuotesEvent {
  FavQuote(this.id);

  final String id;
}

class UnFavQuote extends QuotesEvent {
  UnFavQuote(this.id);

  final String id;
}

class EditQuote extends QuotesEvent {
  EditQuote(this.id, this.text);

  final String id;
  final String text;
}

class DeleteQuote extends QuotesEvent {
  DeleteQuote(this.id);

  final String id;
}
