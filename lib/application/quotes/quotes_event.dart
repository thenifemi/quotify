part of 'quotes_bloc.dart';

@immutable
abstract class QuotesEvent {}

class GetQuotes extends QuotesEvent {}

class FavQuote extends QuotesEvent {
  FavQuote(this.id);

  final String id;
}

class UnFavQuote extends QuotesEvent {
  UnFavQuote(this.id);

  final String id;
}

class EditQuote extends QuotesEvent {
  EditQuote(this.id);

  final String id;
}

class DeleteQuote extends QuotesEvent {
  DeleteQuote(this.id);

  final String id;
}
